class EventObserver < ActiveRecord::Observer
    def after_create(record)
        @event = Event.last
        @organizer = @event.user_id.to_s
        puts "================="
        puts @organizer
        @subscribers = Subscription.find_by_sql(["select * from subscriptions where subscribed_user_id=?",@organizer])
        @subscribers.each do |subscriber|
            puts "Subscribe: #{subscriber.user_id}"
            @notification = Notification.new(:user_id => subscriber.user_id, :event_id => @event.id,:notify_category => "Event", :seen => false)
            puts "Notify: #{@notification.user_id}"
            @notification.save
        end #each loop ends

    end

end