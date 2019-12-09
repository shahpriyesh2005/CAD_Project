require 'log'
require_relative '../../app/pdfs/events_pdf'

$upcoming_events = Event.new
$user_orders_events = Order.new

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_recommendation_vars, only: [:index, :show]
  include Pagy::Backend

  # GET /events
  # GET /events.json
  def index
    if user_signed_in?
      unless $upcoming_events.nil?
        ##### Based on your interests - START #####
        user_interests = User.select(:interest1, :interest2, :interest3, :interest4, :interest5).where(id: current_user.id)

        unless user_interests.nil?
          Log.debug("user_interests => " + user_interests.inspect)

          unless $user_orders_events.nil?
            @user_interests_events = Event.where(id: $upcoming_events).where("category in (?, ?, ?, ?, ?)",
                                                                          user_interests.as_json[0]["interest1"],
                                                                          user_interests.as_json[0]["interest2"],
                                                                          user_interests.as_json[0]["interest3"],
                                                                          user_interests.as_json[0]["interest4"],
                                                                          user_interests.as_json[0]["interest5"])
                                       .where.not(id: $user_orders_events).order("start_time ASC").first(5)
          else
            @user_interests_events = Event.where(id: $upcoming_events).where("category in (?, ?, ?, ?, ?)",
                                                                            user_interests.as_json[0]["interest1"],
                                                                            user_interests.as_json[0]["interest2"],
                                                                            user_interests.as_json[0]["interest3"],
                                                                            user_interests.as_json[0]["interest4"],
                                                                            user_interests.as_json[0]["interest5"])
                                         .order("start_time ASC").first(5)
          end

          unless @user_interests_events.nil?
            Log.debug("user_interests_events => " + @user_interests_events.inspect)
          else
            Log.debug("user_interests_events => NULL")
          end
        else
          Log.debug("user_interests => NULL")
        end
        ##### Based on your interests - END #####

        ##### Previously viewed - START #####
        @previously_viewed_user_events = Event.where("events.id in (select event_id from viewed_events where user_id = #{current_user.id} order by view_time desc)").first(5)

        unless @previously_viewed_user_events.nil?
          Log.debug("previously_viewed_user_events => " + @previously_viewed_user_events.inspect)
        else
          Log.debug("previously_viewed_user_events => NULL")
        end
        ##### Previously viewed - END #####
      end
    end

    @pagy, @events = pagy($upcoming_events, page: params[:page], items: 10)

    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename=events.xlsx"
      }

      format.html { render :index }

      format.pdf do
        pdf = EventsPdf.new($upcoming_events)

        #pdf.encrypt_document(
        #    user_password: 'Event@12345',
        #    owner_password: 'Event@12345',
        #    permissions: {
        #        print_document: false,
        #        modify_contents: false,
        #        copy_contents: false,
        #        modify_annotations: false
        #    }
        #)

        send_data pdf.render,
                  filename: 'events.pdf',
                  type: 'application/pdf',
                  page_size: 'A4',
                  template: "events/index.html.erb",
                  layout: "pdf.html",
                  orientation: "Landscape",
                  lowquality: true,
                  zoom: 1,
                  dpi: 75
      end
    end
  end

  def showOrganizerEvents
    @usernames = params[:user_id].split(' ')
    @userid = User.where("first_name=? AND last_name=?",@usernames[0],@usernames[1]).first
    @events = Event.where("user_id=?",@userid)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if user_signed_in?
      unless $upcoming_events.nil?
        user_ids = ""
        event_ids = ""
        events_count = Hash.new(0)
        events_sorted = Hash.new(0)
        events_sorted_array = Array.new
                
        organizer_id = Event.find(params[:id]).user_id
        subscribe_check_query = ActiveRecord::Base.connection.execute("select * from subscriptions where subscribed_user_id = '#{organizer_id}' and user_id = #{current_user.id} ")
        wishlist_check_query = ActiveRecord::Base.connection.execute("select * from wishlists where event_id = #{params[:id]} and user_id = #{current_user.id} ")
        
        if(subscribe_check_query.as_json != [])
          @isSubscribed = true
        else
          @isSubscribed = false
        end

        if(wishlist_check_query.as_json != [])
          @isWishlisted = true
        else
          @isWishlisted = false
        end
        
        @isSubscribed
        @isWishlisted
        
        upsert_viewed_events

        ##### Customers who bought this also bought - START #####
        other_users_common_orders = Order.distinct.select(:user_id).where(event_id: $upcoming_events, event_id: $user_orders_events)
                                        .where.not(user_id: current_user.id)

        unless other_users_common_orders.nil?
          Log.debug("other_users_common_orders => " + other_users_common_orders.inspect)

          other_users_uncommon_orders_events = Order.distinct.select(:event_id).where(event_id: $upcoming_events, user_id: other_users_common_orders)
                                                   .where.not(event_id: $user_orders_events, event_id: params[:id])

          unless other_users_uncommon_orders_events.nil?
            Log.debug("other_users_uncommon_orders_events => " + other_users_uncommon_orders_events.inspect)

            @other_users_events = Event.where(id: other_users_uncommon_orders_events).order("start_time ASC").first(5)

            unless @other_users_events.nil?
              Log.debug("other_users_events => " + @other_users_events.inspect)
            else
              Log.debug("other_users_events => NULL")
            end
          else
            Log.debug("other_users_uncommon_orders_events => NULL")
          end
        else
          Log.debug("other_users_common_orders => NULL")
        end
        ##### Customers who bought this also bought - END #####

        ##### Customers who viewed this also viewed - START #####
        select_query = "select distinct user_id from viewed_events where event_id = #{params[:id]} and user_id != #{current_user.id}"
        other_users = ActiveRecord::Base.connection.execute(select_query)

        unless other_users.nil?
          Log.debug("other_users => " + other_users.as_json.to_s)

          other_users.each do |user|
            if user_ids != ""
              user_ids += ", "
            end

            user_ids += user["user_id"].to_s
          end

          if user_ids != ""
            Log.debug("user_ids =>" + user_ids)

            select_query_1 = "select distinct event_id from viewed_events where user_id in (" + user_ids + ") "
            select_query_1 += "and event_id not in (select distinct event_id from viewed_events where user_id = #{current_user.id})"
            other_events = ActiveRecord::Base.connection.execute(select_query_1)

            unless other_events.nil?
              Log.debug("other_events => " + other_events.as_json.to_s)

              other_events.each do |event|
                if event_ids != ""
                  event_ids += ", "
                end

                event_ids += event["event_id"].to_s
              end

              if event_ids != ""
                Log.debug("event_ids => " + event_ids)

                upcoming_events_1 = Event.where(id: $upcoming_events).where("id in (" + event_ids + ")").order("start_time ASC")

                unless upcoming_events_1.nil?
                  Log.debug("upcoming_events_1 => " + upcoming_events_1.inspect)

                  upcoming_events_1.each do |event|
                    count = 0
                    Log.debug("event.id => " + event.id.to_s)

                    count_query = "select count(event_id) from viewed_events where event_id = #{event.id} and user_id != #{current_user.id}"
                    count = ActiveRecord::Base.connection.execute(count_query)
                    Log.debug("count => " + count.as_json.to_s)

                    events_count[event] += count[0]["count"]
                    Log.debug("events_count => " + events_count.to_s)
                  end

                  events_sorted = events_count.sort_by { |key, value| value }.reverse
                  Log.debug("events_sorted => " + events_sorted.to_s)

                  events_sorted.each do |event|
                    events_sorted_array << event[0]
                  end

                  @other_users_previously_viewed_events = events_sorted_array
                  Log.debug("other_users_previously_viewed_events =>" + @other_users_previously_viewed_events.inspect)
                else
                  Log.debug("upcoming_events_1 => NULL")
                end
              else
                Log.debug("event_ids => NULL")
              end
            end
          else
            Log.debug("user_ids => NULL")
          end
        end
        ##### Customers who viewed this also viewed - END #####
      end
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.organizer_name = "#{current_user.first_name} #{current_user.last_name}"
    @event.organizer_contact_no = "#{current_user.contact_no}"
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.overall_rating = 0.0r
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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
    @event = Event.find(params[:id])
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
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
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:picture, :title, :category, :description, :organizer_name, :organizer_email, :organizer_contact_no, :venue, :address1, :address2, :city, :county, :country, :start_date, :start_time, :end_date, :end_time, :publish_date, :publish_time, :reserved_seating, :sponsored, :user_id, :overall_rating)
  end

  def upsert_viewed_events
    insert_query = "INSERT INTO VIEWED_EVENTS (USER_ID, EVENT_ID, VIEW_TIME) "
    insert_query += "VALUES (#{current_user.id}, #{params[:id]}, CURRENT_TIMESTAMP)"
    ActiveRecord::Base.connection.execute(insert_query)
  rescue
    update_query = "UPDATE VIEWED_EVENTS SET VIEW_TIME = CURRENT_TIMESTAMP WHERE USER_ID = #{current_user.id} AND EVENT_ID = #{params[:id]}"
    ActiveRecord::Base.connection.execute(update_query)
  end

  def set_recommendation_vars
    $upcoming_events = Event.where("end_time > ? and publish_time <= ?",
                                  Time.now.strftime("%Y-%m-%d %H:%M:%S"),
                                  Time.now.strftime("%Y-%m-%d %H:%M:%S")).order("start_time ASC")

    unless $upcoming_events.nil?
      Log.debug("upcoming_events =>" + $upcoming_events.inspect)

      if user_signed_in?
        $user_orders_events = Order.distinct.select(:event_id).where(event_id: $upcoming_events, user_id: current_user.id)

        unless $user_orders_events.nil?
          Log.debug("user_orders_events => " + $user_orders_events.inspect)
        else
          Log.debug("user_orders_events => NULL")
        end
      end
    else
      Log.debug("upcoming_events => NULL")
    end
  end
end
