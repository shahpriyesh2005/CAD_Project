class EventObserver < ActiveRecord::Observer
    def after_create(record)
        @event = Event.last
        @organizer = @event.user_id.to_s
        
        puts "================="
        puts @organizer
        puts "Notify ID: #{@notify_id}"
        puts "Event id: #{@event.id}"

        @subscribers = Subscription.find_by_sql(["select user_id from subscriptions where subscribed_user_id=?",@organizer])
        @subscribers.each do |subscriber|
            
            #puts "Subscribe: #{subscriber.user_id}"
            #@notification = Notification.new(:user_id => subscriber.user_id, :event_id => @event.id,:notify_category => "Event", :seen => false)
        
            insert_notify_query = "insert into notifications(users_id,events_id,notify_category,seen,created_at,updated_at) values(#{subscriber.user_id},#{@event.id},'Event',false,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)"
            ActiveRecord::Base.connection.execute(insert_notify_query)
           
            #puts "Notify: #{@notification.user_id}"
            #@notification.save
        
        end #each loop ends

    end

end