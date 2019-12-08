class OrderObserver < ActiveRecord::Observer
    
    def after_create(record)
        @order = Order.last
        @event = Event.find(@order.event_id)
        insert_rating_query = "insert into ratings(user_rating,user_review,rating_date,users_id,events_id,ticket_id,created_at,updated_at) values(0,'',CURRENT_TIMESTAMP,#{@order.user_id},#{@order.event_id},#{@order.ticket_id},CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)"
        @status = ActiveRecord::Base.connection.execute(insert_rating_query)
        puts "#{@status}"
        SendCustomMail.new(User.find(@order.user_id).email, "Thanks for your Order for the Event #{@event.title}").process.deliver
       
    end

end