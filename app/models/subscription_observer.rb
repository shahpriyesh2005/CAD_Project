class SubscriptionObserver < ActiveRecord::Observer
    def after_create(record)
        @organizer = record.subscribed_user_id
        @current_user = User.find(record.user_id)
        @organizer_name = User.find(@organizer)
        insert_notify_query = "insert into notifications(users_id,events_id,notify_category,seen,created_at,updated_at) values(#{@organizer},1,'Subscription',false,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)"
        ActiveRecord::Base.connection.execute(insert_notify_query)           
        
    end

end