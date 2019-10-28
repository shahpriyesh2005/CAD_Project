class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @user = User.find(params[:user_id])
    
    @ratings = @user.ratings
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @user = User.find(params[:user_id])
    @rating = @user.ratings.find(params[:id])
  end

  # GET /ratings/new
  def new
    @user = User.find(params[:user_id])
    @rating = @user.ratings.build()
  end

  # GET /ratings/1/edit
  def edit
    @user = User.find(params[:user_id])
    @rating = @user.ratings.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @user = User.find(params[:user_id])
    @rating = @user.ratings.build(rating_params)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to user_rating_url(@user, @rating), notice: 'Event was successfully added.' }
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
    @user = User.find(params[:user_id])
    @rating = @user.ratings.find(params[:id])
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to user_rating_url(@user, @rating), notice: 'Rating was successfully updated.' }
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
    @user = User.find(params[:user_id])
    @rating = @user.ratings.find(params[:id])
    @rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:user_rating, :user_review, :rating_date, :user_id, :event_id, :ticket_id)
    end
end
