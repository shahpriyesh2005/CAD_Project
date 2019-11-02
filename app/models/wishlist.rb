class Wishlist < ApplicationRecord
  belongs_to :user

  EVENT_NAME = []
  @events = Event.distinct.pluck(:title)

  @events.each do |names|
    EVENT_NAME << names
  end

end
