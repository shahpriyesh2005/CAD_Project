class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @user = User.find(params[:user_id])
    
    @events = @user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
  end

  # GET /events/new
  def new
    @user = User.find(params[:user_id])
    @event = @user.events.build()
  end

  # GET /events/1/edit
  def edit
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @user = User.find(params[:user_id])
    @event = @user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to user_event_url(@user, @event), notice: 'Event was successfully added.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_event_url(@user, @event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @user = User.find(params[:user_id])
    @event = @user.events.find(params[:id])
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :category, :description, :organizer_name, :organizer_email, :organizer_contact_no, :venue, :address1, :address2, :city, :county, :country, :start_time, :end_time, :publish_time, :reserved_seating, :sponsored, :user_id)
    end
end
