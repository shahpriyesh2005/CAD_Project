class User < ApplicationRecord
    has_many :events
    has_many :subscriptions
    has_many :wishlists
    has_many :orders
    has_many :ratings
    has_many :tickets
    
    USER_INTEREST  = ["", "Charity and Causes", "Competition", "Concert", "Conference", "Convention", "Education", "Fair", "Fashion and Beauty", "Film and Entertainment", "Food and Drink", "Health and Wellness", "Home and Lifestyle", "Performing and Visual Arts", "Religion and Spirituality", "Science and Technology", "Seminar", "Singing", "Sports and Fitness", "Travel and Outdoor", "Workshop"]
    USER_CITY  = ["", "Antrim", "Armagh", "Carlow", "Cavan", "Clare", "Cork", "Derry", "Donegal", "Down", "Dublin", "Fermanagh", "Galway", "Kerry", "Kildare", "Kilkenny", "Laois", "Leitrim", "Limerick", "Longford", "Louth", "Mayo", "Meath", "Monaghan", "Offaly", "Roscommon", "Sligo", "Tipperary", "Tyrone", "Waterford", "Westmeath", "Wexford", "Wicklow"]
    USER_COUNTY  = ["", "Antrim", "Armagh", "Carlow", "Cavan", "Clare", "Cork", "Derry", "Donegal", "Down", "Dublin", "Fermanagh", "Galway", "Kerry", "Kildare", "Kilkenny", "Laois", "Leitrim", "Limerick", "Longford", "Louth", "Mayo", "Meath", "Monaghan", "Offaly", "Roscommon", "Sligo", "Tipperary", "Tyrone", "Waterford", "Westmeath", "Wexford", "Wicklow"]
    USER_COUNTRY  = ["Republic of Ireland"]

    validates_format_of :first_name, :last_name, :gender, :address1, :city, :county, :country, :with => /[a-z]+/i, :presence => true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :presence => true
    validates_format_of :contact_no, :with => /[0-9]+/i, :presence => true
end
