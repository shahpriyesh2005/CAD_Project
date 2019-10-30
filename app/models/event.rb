class Event < ApplicationRecord
  has_many :tickets
  has_many :ratings

  EVENT_CATEGORY  = ["", "Charity and Causes", "Competition", "Concert", "Conference", "Convention", "Education", "Fair", "Fashion and Beauty", "Film and Entertainment", "Food and Drink", "Health and Wellness", "Home and Lifestyle", "Performing and Visual Arts", "Religion and Spirituality", "Science and Technology", "Seminar", "Singing", "Sports and Fitness", "Travel and Outdoor", "Workshop"]
  EVENT_CITY  = ["", "Antrim", "Armagh", "Carlow", "Cavan", "Clare", "Cork", "Derry", "Donegal", "Down", "Dublin", "Fermanagh", "Galway", "Kerry", "Kildare", "Kilkenny", "Laois", "Leitrim", "Limerick", "Longford", "Louth", "Mayo", "Meath", "Monaghan", "Offaly", "Roscommon", "Sligo", "Tipperary", "Tyrone", "Waterford", "Westmeath", "Wexford", "Wicklow"]
  EVENT_COUNTY  = ["", "Antrim", "Armagh", "Carlow", "Cavan", "Clare", "Cork", "Derry", "Donegal", "Down", "Dublin", "Fermanagh", "Galway", "Kerry", "Kildare", "Kilkenny", "Laois", "Leitrim", "Limerick", "Longford", "Louth", "Mayo", "Meath", "Monaghan", "Offaly", "Roscommon", "Sligo", "Tipperary", "Tyrone", "Waterford", "Westmeath", "Wexford", "Wicklow"]
  EVENT_COUNTRY  = ["Republic of Ireland"]

  validates_format_of :title, :category, :description, :organizer_name, :venue, :address1, :city, :county, :country, :reserved_seating, :sponsored, :with => /[a-z]+/i, :presence => true
  validates_format_of :organizer_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :presence => true
  validates_format_of :organizer_contact_no, :with => /[0-9]+/i, :presence => true
  validates :start_time, :end_time, :publish_time, :presence => true
  validate :validate_date

  private

  def validate_date
    return if end_time.blank? || start_time.blank? || publish_time.blank?

    if end_time < start_time
      errors.add(:end_time, "cannot be less than start time")
    end

    if publish_time > start_time
      errors.add(:start_time, "cannot be less than publish time")
    end
  end
end
