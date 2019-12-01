class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @user = User.find(current_user.id)
    
    @subscriptions = @user.subscriptions

    @subscriptions.each do |subscribe|
      @name = User.find(subscribe[:subscribed_user_id])
      subscribe.subscribed_user_id = (@name.first_name + " " + @name.last_name)
    end
    

  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @user = User.find(current_user.id)
    @subscription = @user.subscriptions.find(params[:id])
    @name = User.find(@subscription[:subscribed_user_id])
    @subscription.subscribed_user_id = (@name.first_name + " " + @name.last_name)

  end

  # GET /subscriptions/new
  def new
    @user = User.find(current_user.id)
    @subscription = @user.subscriptions.build()
  end

  # GET /subscriptions/1/edit
  def edit
    @user = User.find(current_user.id)
    @subscription = @user.subscriptions.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    #@user = User.find(current_user.id)
    @subscription = Subscription.new(subscription_params)
    #@usernames = params[:subscription][:subscribed_user_id].split(' ')
    #@userid = User.where("first_name=? AND last_name=?",@usernames[0],@usernames[1]).first
    #@subscription.subscribed_user_id = @userid[:id]
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subscription_url( @subscription), notice: 'Subscription was successfully added.' }
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
    @user = User.find(current_user.id)
    @usernames = params[:subscription][:subscribed_user_id].split(' ')
    @userid = User.where("first_name=? AND last_name=?",@usernames[0],@usernames[1]).first
    params[:subscription][:subscribed_user_id] = @userid.id
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to subscription_url(@subscription), notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @user = User.find(current_user.id)
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
