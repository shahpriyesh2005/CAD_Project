class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :ticket
end
