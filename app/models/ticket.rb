class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_format_of :type, :name, :category, :description, :include_fees_in_ticket_price, :currency, :with => /[a-z]+/i, :presence => true
  validates_format_of :total_quantity, :ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :min_tickets, :max_tickets, :with => /[0-9]+/i, :presence => true
  validates :sale_start_time, :sale_end_time, :presence => true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if sale_end_time.blank? || sale_start_time.blank?

    if sale_end_time < sale_start_time
      errors.add(:sale_end_time, "cannot be less than sale start time")
    end
 end
end