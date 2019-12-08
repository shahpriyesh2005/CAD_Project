require 'log'

class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    if user_signed_in?
      ##### Based on your interests - START #####

      already_subscribed_organizers = ActiveRecord::Base.connection.execute("select CAST(subscribed_user_id as BIGINT) from subscriptions where user_id = #{current_user.id}")

      user_interests = User.select(:interest1, :interest2, :interest3, :interest4, :interest5).where(id: current_user.id)
      
      @organizers = Array.new

      already_subscribed_organizers.as_json.each do |user|
        @organizers << user["subscribed_user_id"]
      end
      unless user_interests.nil?
        Log.debug("user_interests => " + user_interests.inspect)
        if @organizers == []
          user_interest_events = Event.select(:user_id).where("category in (?, ?, ?, ?, ?)",
                                                            user_interests.as_json[0]["interest1"],
                                                            user_interests.as_json[0]["interest2"],
                                                            user_interests.as_json[0]["interest3"],
                                                            user_interests.as_json[0]["interest4"],
                                                            user_interests.as_json[0]["interest5"])
                                                            .where.not(user_id: current_user.id)
            
        else
          user_interest_events = Event.select(:user_id).where("category in (?, ?, ?, ?, ?)",
                                                            user_interests.as_json[0]["interest1"],
                                                            user_interests.as_json[0]["interest2"],
                                                            user_interests.as_json[0]["interest3"],
                                                            user_interests.as_json[0]["interest4"],
                                                            user_interests.as_json[0]["interest5"])
                                    .where.not(user_id: current_user.id).where.not("user_id in (?)",@organizers)
        end
        unless user_interest_events.as_json == []
          @user_interest_organizers = Array.new
          Log.debug("user_interest_events => " + user_interest_events.inspect)
          user_interest_events.as_json.each do |organizer|
            @user_interest_organizers << User.where(id: organizer["user_id"]).first
          end
          unless @user_interest_organizers.nil?
            Log.debug("user_interest_organizers => " + @user_interest_organizers.inspect)
          else
            Log.debug("user_interest_organizers => NULL")
          end
        else
          Log.debug("user_interest_events => NULL")
        end
      else
        Log.debug("user_interests => NULL")
      end
      ##### Based on your interests - END #####
      
    end

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
    redirect_to subscriptions_path
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
