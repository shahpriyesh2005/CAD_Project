class Order < ApplicationRecord
  belongs_to :event

  validates_format_of :currency, :guest_first_name, :guest_last_name, :payment_method, :with => /[a-z]+/i, :presence => true
  validates_format_of :no_of_tickets, :ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :total_ticket_price, :total_fees, :total_actual_ticket_price, :total_organizer_payout, :card_no, :with => /[0-9]+/i, :presence => true
  validates_format_of :guest_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :presence => true
  validates_format_of :guest_contact_no, :with => /[0-9]+/i, :presence => true
  validates :expiry_date, :order_date, :presence => true
  validate :validate_date

  private

  def validate_date
    return if expiry_date.blank? || order_date.blank?

    if expiry_date < order_date
      errors.add(:expiry_date, "cannot be less than order date")
    end
 end
end
