require 'log'

class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    ticket_sold_weight = Hash.new(0)
    tickets_sorted = Hash.new(0)
    tickets_sorted_array = Array.new
    tickets_sorted_weight = Array.new
    event_orders = Order.new

    @event = Event.find(params[:event_id])
    tickets_unsorted = @event.tickets.where("sale_start_time <= ? and sale_end_time > ?",
                                            Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                                            Time.now.strftime("%Y-%m-%d %H:%M:%S")).order("ticket_type ASC")

    event_orders = Order.select(:no_of_tickets).where(event_id: params[:event_id])

    if event_orders.length > 0
      Log.debug("event_orders => " + event_orders.as_json.to_s)

      total_tickets_sold = event_orders.sum(:no_of_tickets)
      Log.debug("total_tickets_sold => " + total_tickets_sold.as_json.to_s)

      if total_tickets_sold > 0
        unless tickets_unsorted.nil?
          Log.debug("tickets_unsorted => " + tickets_unsorted.as_json.to_s)

          ticket_sold = 0
          weight = 0

          tickets_unsorted.each do |ticket|
            Log.debug("ticket.id => " + ticket.id.to_s)
            temp_no_of_tickets = Order.select(:no_of_tickets).where(event_id: params[:event_id], ticket_id: ticket.id)
            ticket_sold = temp_no_of_tickets.sum(:no_of_tickets)
            Log.debug("ticket_sold => " + ticket_sold.as_json.to_s)

            if ticket_sold > 0
              weight = ticket_sold.to_f / total_tickets_sold
            else
              weight = 0
            end
            Log.debug("weight => " + weight.to_s)

            ticket_sold_weight[ticket] += weight
            Log.debug("ticket_sold_weight => " + ticket_sold_weight.as_json.to_s)
          end

          tickets_sorted = ticket_sold_weight.sort_by { |key, value| value }.reverse
          Log.debug("tickets_sorted => " + tickets_sorted.as_json.to_s)

          tickets_sorted.each do |ticket|
            tickets_sorted_array << ticket[0]
            tickets_sorted_weight << ticket[1]
          end

          @tickets = tickets_sorted_array
          @tickets_weight = tickets_sorted_weight
        else
          Log.debug("tickets_unsorted => NULL")
          @tickets = tickets_unsorted

          tickets_unsorted.each do |ticket|
            tickets_sorted_weight << 0
          end

          @tickets_weight = tickets_sorted_weight
        end
      else
        @tickets = tickets_unsorted

        tickets_unsorted.each do |ticket|
          tickets_sorted_weight << 0
        end

        @tickets_weight = tickets_sorted_weight
      end
    else
      Log.debug("event_orders => NULL")

      @tickets = tickets_unsorted

      tickets_unsorted.each do |ticket|
        tickets_sorted_weight << 0
      end

      @tickets_weight = tickets_sorted_weight
    end

    Log.debug("@tickets => " + @tickets.as_json.to_s)
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.find(params[:id])
  end

  # GET /tickets/new
  def new
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.build()
  end

  # GET /tickets/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.build(ticket_params)
    @ticket.user_id = current_user.id

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to event_ticket_url(@event, @ticket), notice: 'Ticket was successfully added.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.find(params[:id])
    @ticket.user_id = current_user.id

    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to event_ticket_url(@event, @ticket), notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to event_tickets_url, notice: 'Ticket was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @event = Event.find(params[:event_id])
      @ticket = @event.tickets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:entry_type, :ticket_type, :category, :description, :total_quantity, :ticket_price, :include_fees_in_ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :sale_start_time, :sale_end_time, :currency, :user_id, :event_id, :available_quantity)
    end
end
