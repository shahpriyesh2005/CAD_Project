class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @user = User.find(params[:user_id])
    
    @orders = @user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end

  # GET /orders/new
  def new
    @user = User.find(params[:user_id])
    @order = @user.orders.build()
  end

  # GET /orders/1/edit
  def edit
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = User.find(params[:user_id])
    @order = @user.orders.build(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to user_order_url(@user, @order), notice: 'Order was successfully added.' }
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
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
    respond_to do |format|
      if @event.update(order_params)
        format.html { redirect_to user_order_url(@user, @order), notice: 'Event was successfully updated.' }
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
    @user = User.find(params[:user_id])
    @order = @user.orders.find(params[:id])
    @order.destroy
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
end
