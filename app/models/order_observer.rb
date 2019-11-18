class OrderObserver < ActiveRecord::Observer
    
    def after_create(record)
        @order = Order.last
        puts @order.event_id
        puts @order.user_id
        @date = Date.parse(Time.now.to_s)
        puts @date
        @rating = Rating.new(:user_rating => 0, :user_review => "", :rating_date => @date , :user_id => @order.user_id, :event_id => @order.event_id, :ticket_id => @order.ticket_id )
        puts "date is: #{@rating.rating_date}"
        puts "ID is: #{@rating.user_id}"
        @rating.save
    end

end