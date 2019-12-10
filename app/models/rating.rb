class Rating < ApplicationRecord
  belongs_to :event, optional: true

  validates_format_of :user_rating, :with => /[0-9]+/i, :presence => true
  validates_format_of :user_review, :with => /[a-z]+/i, :presence => true

  validates :user_review,:rating_date,:ticket_id, :presence => true
  validate :check_rating_date
  
    private
  
    def check_rating_date
      return if rating_date.blank?
  
      if rating_date.strftime("%Y-%m-%d") < Time.now.strftime("%Y-%m-%d")
        errors.add(:rating_date, "should be greater than current time")
      end
    end  

end
