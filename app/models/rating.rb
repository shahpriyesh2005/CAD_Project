class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :ticket

  validates_format_of :user_rating, :with => /[0-9]+/i, :presence => true
  validates_format_of :user_review, :with => /[a-z]+/i, :presence => true
end
