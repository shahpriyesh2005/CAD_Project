class OrderObserver < ActiveRecord::Observer
    
    def after_create(record)
        @order = Order.last
        @date = Date.parse(Time.now.to_s)
        
        #puts @order.event_id
        #puts @order.user_id
        #puts @date
        
        @rating_id = Rating.select(:id).last 
        puts @rating_id
        @rating_id = @rating_id + 1 
        @timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
        #@rating = Rating.new(:user_rating => 0, :user_review => "", :rating_date => @date , :user_id => @order.user_id, :event_id => @order.event_id, :ticket_id => @order.ticket_id )
        
        #insert_rating_query = "insert into ratings values(#{@rating_id},0,'','#{@date}',#{@order.user_id},#{@order.event_id},#{@order.ticket_id},'','' )"
        #ActiveRecord::Base.connection.execute(insert_rating_query)
       
        #puts "date is: #{@rating.rating_date}"
        #puts "ID is: #{@rating.user_id}"
        
    end

end