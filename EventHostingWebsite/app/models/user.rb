class User < ApplicationRecord
    has_many :events
    has_many :subscriptions
    has_many :wishlists
end
