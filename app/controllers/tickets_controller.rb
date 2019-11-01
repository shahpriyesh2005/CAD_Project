class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @event = Event.find(params[:event_id])
    @tickets = @event.tickets
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
