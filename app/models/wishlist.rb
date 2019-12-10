class Wishlist < ApplicationRecord
  belongs_to :user
  
  
  EVENT_NAME = []
  @events = Event.distinct.pluck(:title)

  @events.each do |names|
    EVENT_NAME << names
  end

  validates :wishlist_date,:user_id,:event_id, :presence => true
    validate :check_wishlist_date
  
    private
  
    def check_wishlist_date
      return if wishlist_date.blank?
  
      if wishlist_date.strftime("%Y-%m-%d") < Time.now.strftime("%Y-%m-%d")
        errors.add(:wishlist_date, "should be greater than current time")
      end
    end

end
