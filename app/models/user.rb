require 'log'
require 'passwordValidator'

class User < ApplicationRecord

  has_many :wishlists
  has_many :subscriptions
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  USER_INTEREST = ["", "Charity and Causes", "Competition", "Concert", "Conference", "Convention", "Education", "Fair", "Fashion and Beauty", "Film and Entertainment", "Food and Drink", "Health and Wellness", "Home and Lifestyle", "Performing and Visual Arts", "Religion and Spirituality", "Science and Technology", "Seminar", "Singing", "Sports and Fitness", "Travel and Outdoor", "Workshop"]
  USER_CITY = ["", "Antrim", "Armagh", "Carlow", "Cavan", "Clare", "Cork", "Derry", "Donegal", "Down", "Dublin", "Fermanagh", "Galway", "Kerry", "Kildare", "Kilkenny", "Laois", "Leitrim", "Limerick", "Longford", "Louth", "Mayo", "Meath", "Monaghan", "Offaly", "Roscommon", "Sligo", "Tipperary", "Tyrone", "Waterford", "Westmeath", "Wexford", "Wicklow"]
  USER_COUNTY = ["", "Antrim", "Armagh", "Carlow", "Cavan", "Clare", "Cork", "Derry", "Donegal", "Down", "Dublin", "Fermanagh", "Galway", "Kerry", "Kildare", "Kilkenny", "Laois", "Leitrim", "Limerick", "Longford", "Louth", "Mayo", "Meath", "Monaghan", "Offaly", "Roscommon", "Sligo", "Tipperary", "Tyrone", "Waterford", "Westmeath", "Wexford", "Wicklow"]
  USER_COUNTRY = ["Republic of Ireland"]

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :presence => true, :uniqueness => true
  validate :profile_details, :on => :update

  def profile_details
    Log.debug("Inside profile_details")

    if password.nil?
      Log.debug("Inside password.nil if condition")

      validates_format_of :first_name, :last_name, :gender, :address1, :city, :county, :country, :with => /[a-z]+/i, :presence => true, :on => :update
      validates_format_of :contact_no, :with => /[0-9]+/i, :presence => true, :on => :update

      validates_length_of :first_name, :last_name, minimum: 3, allow_blank: false, :on => :update
      validates_length_of :address1, minimum: 5, allow_blank: false, :on => :update
      validates_length_of :contact_no, minimum: 10, allow_blank: false, :on => :update

      validates_presence_of :interest1, :interest2, :interest3, :interest4, :interest5, :on => :update

      if interest1 == interest2
        errors.add :interest2, " cannot be same as Interest1."
      end

      if interest1 == interest3
        errors.add :interest3, " cannot be same as Interest1."
      end

      if interest1 == interest4
        errors.add :interest4, " cannot be same as Interest1."
      end

      if interest1 == interest5
        errors.add :interest5, " cannot be same as Interest1."
      end

      if interest2 == interest3
        errors.add :interest3, " cannot be same as Interest2."
      end

      if interest2 == interest4
        errors.add :interest4, " cannot be same as Interest2."
      end

      if interest2 == interest5
        errors.add :interest5, " cannot be same as Interest2."
      end

      if interest3 == interest4
        errors.add :interest4, " cannot be same as Interest3."
      end

      if interest3 == interest5
        errors.add :interest5, " cannot be same as Interest3."
      end

      if interest4 == interest5
        errors.add :interest5, " cannot be same as Interest4."
      end
    else
      Log.debug("Inside password.nil else condition")

      required_complexity = 3

      unless PasswordComplexity.new(password, required_complexity).valid?
        errors.add :password, " does not match the security requirements."
      end
    end
  end

end
