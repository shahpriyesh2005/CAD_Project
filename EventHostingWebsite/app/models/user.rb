class User < ApplicationRecord
    has_many :events
    has_many :subscriptions

    validates_format_of :first_name, :last_name, :gender, :address1, :city, :county, :country, :with => /[a-z]+/i, :presence => true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :presence => true
    validates_format_of :contact_no, :with => /[0-9]+/i, :presence => true
end
