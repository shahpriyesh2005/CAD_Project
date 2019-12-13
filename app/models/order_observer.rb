class OrderObserver < ActiveRecord::Observer
    
    def after_create(record)
        @order = Order.last
        @event = Event.find(@order.event_id)
        check_rating_present = ActiveRecord::Base.connection.execute("select * from ratings where users_id = #{@order.user_id} and events_id=#{@order.event_id}")
        if check_rating_present.as_json == []
            insert_rating_query = "insert into ratings(user_rating,user_review,rating_date,users_id,events_id,ticket_id,created_at,updated_at) values(0,'',CURRENT_TIMESTAMP,#{@order.user_id},#{@order.event_id},#{@order.ticket_id},CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)"
            ActiveRecord::Base.connection.execute(insert_rating_query)
            puts check_rating_present.as_json
        end    

    end

end