class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @user = User.find(params[:user_id])
    @tickets = @user.tickets
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.find(params[:id])
  end

  # GET /tickets/new
  def new
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.build()
  end

  # GET /tickets/1/edit
  def edit
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.build(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to user_ticket_url(@user, @ticket), notice: 'Ticket was successfully added.' }
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
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.find(params[:id])
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to user_ticket_url(@user, @ticket), notice: 'Ticket was successfully updated.' }
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
    @user = User.find(params[:user_id])
    @ticket = @user.tickets.find(params[:id])
    @ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:type, :name, :category, :description, :total_quantity, :ticket_price, :include_fees_in_ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :sale_start_time, :sale_end_time, :min_tickets, :max_tickets, :currency, :user_id, :event_id)
    end
end
