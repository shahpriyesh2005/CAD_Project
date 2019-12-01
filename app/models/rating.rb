class Rating < ApplicationRecord
  belongs_to :event, optional: true

  validates_format_of :user_rating, :with => /[0-9]+/i, :presence => true
  validates_format_of :user_review, :with => /[a-z]+/i, :presence => true
end
