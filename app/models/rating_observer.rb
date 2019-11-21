class RatingObserver < ActiveRecord::Observer

    def after_update(record)

        @event = Event.find(record.event_id)
        @organizer = @event.user_id 
        insert_notify_query = "insert into notifications(users_id,events_id,notify_category,seen,created_at,updated_at) values(#{@organizer},#{record.event_id},'Rating',false,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)"
        ActiveRecord::Base.connection.execute(insert_notify_query)
           
    end

end