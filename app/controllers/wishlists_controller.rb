class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @user = User.find(current_user.id)
    
    @wishlists = @user.wishlists

    @wishlists.each do |wishlist|
      @event = Event.find(wishlist.event_id)
      wishlist.event_id = @event.title
    end

  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    @user = User.find(current_user.id)
    @wishlist = @user.wishlists.find(params[:id])

    @event = Event.find(@wishlist.event_id)
    @wishlist.event_id = @event.title

  end

  # GET /wishlists/new
  def new
    @user = User.where("id=?",current_user.id).first
    @wishlist = @user.wishlists.build()
  end

  # GET /wishlists/1/edit
  def edit
    @user = User.where("id=?",current_user.id).first
    @wishlist = @user.wishlists.find(params[:id])
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @user = User.find(current_user.id)
    @wishlist = @user.wishlists.build(wishlist_params)
    @event = params[:wishlist][:event_id]
    @eventid = Event.where("title=?",@event).first
    @wishlist.event_id = @eventid[:id]
    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to wishlist_url(@wishlist), notice: 'wishlist was successfully added.' }
        format.json { render :show, status: :created, location: @wishlist }
      else
        format.html { render :new }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlists/1
  # PATCH/PUT /wishlists/1.json
  def update
    @user = User.find(current_user.id)
    @event = params[:wishlist][:event_id]
    @eventid = Event.where("title=?",@event).first
    params[:wishlist][:event_id] = @eventid.id
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to wishlist_url(@wishlist), notice: 'wishlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @director }
      else
        format.html { render :edit }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @user = User.find(current_user.id)
    @wishlist = @user.wishlists.find(params[:id])
    @wishlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_params
      params.require(:wishlist).permit(:wishlist_date, :event_id)
    end
end
