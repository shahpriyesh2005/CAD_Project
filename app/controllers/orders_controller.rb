require 'log'

class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  after_action :update_availability, only: [:create]
  include Pagy::Backend

  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin
      @pagy, @orders = pagy(Order.all.order("id ASC"), page: params[:page], items: 10)
    else
      @pagy, @orders = pagy(Order.where(guest_email: current_user.email).order("id ASC"), page: params[:page], items: 10)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.find(params[:ticket_id])
    @order = Order.new
    @order.event_id = @event.id
    @order.ticket_id = @ticket.id
    @order.ticket_price = @ticket.ticket_price
    @order.fees_per_ticket = @ticket.fees_per_ticket
    @order.actual_ticket_price = @ticket.actual_ticket_price
    @order.organizer_payout_per_ticket = @ticket.organizer_payout_per_ticket
    @order.guest_first_name = current_user.first_name
    @order.guest_last_name = current_user.last_name
    @order.guest_email = current_user.email
    @order.guest_contact_no = current_user.contact_no
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.order_date = Time.now.strftime("%b %-d, %Y")
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.save
        SendCustomMail.new(current_user.email, "ORDER").process.deliver

        format.html { redirect_to @order, notice: 'Order was successfully added.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @order.order_date = Time.now.strftime("%b %-d, %Y")
    @order.user_id = current_user.id

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:no_of_tickets, :ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :total_ticket_price, :total_fees, :total_actual_ticket_price, :total_organizer_payout, :currency, :guest_first_name, :guest_last_name, :guest_email, :guest_contact_no, :payment_method, :card_no, :expiry_date, :order_date, :user_id, :event_id, :ticket_id)
    end

    def check_availability
      Log.debug("Inside check_availability")
      order_ticket_id = params["order"]["ticket_id"]
      Log.debug("order_ticket_id => " + order_ticket_id)
      order_no_of_tickets = params["order"]["no_of_tickets"]
      Log.debug("order_no_of_tickets => " + order_no_of_tickets)
      available_quantity = Ticket.where(id: order_ticket_id)
      available_quantity = available_quantity.as_json[0]["available_quantity"]
      Log.debug("available_quantity => " + available_quantity.to_s)

      if order_no_of_tickets.to_i > available_quantity.to_i
        # @order = Order.new(order_params)
        #
        # respond_to do |format|
        #   format.html { render :new }
        #   format.json { render json: @order.errors, status: "No. of tickets is more than available tickets" }
        # end

        return false
      end
    end

  def update_availability
    Log.debug("Inside update_availability")
    order_ticket_id = params["order"]["ticket_id"]
    Log.debug("order_ticket_id => " + order_ticket_id)
    order_no_of_tickets = params["order"]["no_of_tickets"]
    Log.debug("order_no_of_tickets => " + order_no_of_tickets)
    available_quantity = Ticket.where(id: order_ticket_id)
    available_quantity = available_quantity.as_json[0]["available_quantity"]
    Log.debug("available_quantity => " + available_quantity.to_s)
    new_available_quantity = available_quantity.to_i - order_no_of_tickets.to_i
    Log.debug("new_available_quantity => " + new_available_quantity.to_s)
    # Ticket.where(id: order_ticket_id).update(available_quantity: new_available_quantity)
    # Ticket.update(id: order_ticket_id, available_quantity: new_available_quantity)
    update_query = "UPDATE TICKETS SET AVAILABLE_QUANTITY = #{new_available_quantity} WHERE ID = #{order_ticket_id}"
    ActiveRecord::Base.connection.execute(update_query)
  end
end
