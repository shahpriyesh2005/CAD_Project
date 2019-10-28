class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]

  # GET /wishlists
  # GET /wishlists.json
  def index
    @user = User.find(params[:user_id])
    
    @wishlists = @user.wishlists
  end

  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    @user = User.find(params[:user_id])
    @wishlist = @user.wishlists.find(params[:id])
  end

  # GET /wishlists/new
  def new
    @user = User.find(params[:user_id])
    @wishlist = @user.wishlists.build()
  end

  # GET /wishlists/1/edit
  def edit
    @user = User.find(params[:user_id])
    @wishlist = @user.wishlists.find(params[:id])
  end

  # POST /wishlists
  # POST /wishlists.json
  def create
    @user = User.find(params[:user_id])
    @wishlist = @user.wishlists.build(wishlist_params)
    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to user_wishlist_url(@user, @wishlist), notice: 'wishlist was successfully added.' }
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
    @user = User.find(params[:user_id])
    @wishlist = @user.wishlists.find(params[:id])
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to user_wishlist_url(@user, @wishlist), notice: 'wishlist was successfully updated.' }
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
    @user = User.find(params[:user_id])
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
      params.require(:wishlist).permit(:wishlist_date, :user_id, :event_id)
    end
end
