class RatingObserver < ActiveRecord::Observer

    def after_update(record)
        
        @current_user = User.find(record.user_id)
        @event = Event.find(record.events_id)
        @organizer = @event.user_id 
        insert_notify_query = "insert into notifications(users_id,events_id,notify_category,seen,created_at,updated_at) values(#{@organizer},#{record.events_id},'Rating',false,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)"
        ActiveRecord::Base.connection.execute(insert_notify_query)
      
        @rating_sum = Rating.where("user_rating > 0 and events_id = ?",@event.id).sum(:user_rating)
        @rating_count = Rating.where("user_rating > 0 and events_id = ?",@event.id).count
        @avg_rating = (@rating_sum / @rating_count).round(1) 
        puts @rating_sum 
        puts @rating_count
        puts @avg_rating 
        update_event_rating_query = "update events set overall_rating = #{@avg_rating} where id = #{@event.id}" 
        ActiveRecord::Base.connection.execute(update_event_rating_query)
        SendCustomMail.new(@current_user.email, "Event #{@event.title} Rated Successfully.").process.deliver

    end

end