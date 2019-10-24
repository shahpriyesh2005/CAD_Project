class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @user = User.find(params[:user_id])
    
    @subscriptions = @user.subscriptions
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.find(params[:id])
  end

  # GET /subscriptions/new
  def new
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.build()
  end

  # GET /subscriptions/1/edit
  def edit
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.build(subscription_params)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to user_subscription_url(@user, @subscription), notice: 'Subscription was successfully added.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.find(params[:id])
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to user_subscription_url(@user, @event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @director }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @user = User.find(params[:user_id])
    @subscription = @user.subscriptions.find(params[:id])
    @subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:subscribed_user_id, :subscription_date, :user_id)
    end
end
