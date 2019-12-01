class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  # GET /ratings
  # GET /ratings.json
  def index
    @user = User.find(current_user.id)
    @events = Event.where(id: Order.where("user_id=?",@user.id).distinct.pluck("event_id"))
    @ratings = Array.new
    @events.each do |event|
      puts event
      puts event.start_time
      puts Time.now
      if event.start_time <= Time.now
        puts "inside insertion"
        @rating = Rating.where("users_id=? AND events_id=?",@user.id,event.id)
        @ratings << @rating if !@rating.nil? 
      end #inner if ends
    end
    @ratings.as_json
    puts @ratings  
  end

  def showEventRating
    @ratings = Rating.where("events_id = ?",params[:events_id])
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @user = User.find(current_user.id)
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to rating_url(@rating), notice: 'Rating was successfully added.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    @user = User.find(current_user.id)
    @rating = Rating.find(params[:id])
    #rating_params[:events_id] = Event.where("title=?",rating_params[:events_id]).first.id
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to rating_url(@rating), notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
  end

  def findEventName
    @event = Event.find(params[:event_id]) 
    @event.title
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:user_rating, :user_review, :rating_date, :users_id, :events_id, :ticket_id)
    end
end
