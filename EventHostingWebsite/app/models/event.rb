class Event < ApplicationRecord
  belongs_to :user

  validates_format_of :title, :category, :description, :organizer_name, :venue, :address1, :address2, :city, :county, :country, :reserved_seating, :sponsored, :with => /[a-z]+/i, :presence => true
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
