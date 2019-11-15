class Ticket < ApplicationRecord
  belongs_to :event

  TICKET_CURRENCY  = ["Euro"]

  validates_format_of :entry_type, :ticket_type, :category, :description, :include_fees_in_ticket_price, :currency, :with => /[a-z]+/i, :presence => true
  validates_format_of :total_quantity, :ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :with => /[0-9]+/i, :presence => true

  validates_length_of :description, minimum: 20, allow_blank: false

  validates :sale_start_time, :sale_end_time, :presence => true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if sale_end_time.blank? || sale_start_time.blank?

    if sale_start_time.strftime("%Y-%m-%d %H:%M:%S") < Time.now.strftime("%Y-%m-%d %H:%M:%S")
      errors.add(:sale_start_time, "should be greater than current time")
    end

    if sale_end_time.strftime("%Y-%m-%d %H:%M:%S") < Time.now.strftime("%Y-%m-%d %H:%M:%S")
      errors.add(:sale_end_time, "should be greater than current time")
    end

    if sale_end_time < sale_start_time
      errors.add(:sale_end_time, "cannot be less than sale start time")
    end
  end
end
