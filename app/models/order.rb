require 'log'
require 'luhnAlgorithmCheck'

class Order < ApplicationRecord

  NO_OF_TICKETS = ["", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  ORDER_CURRENCY  = ["Euro"]

  validates_format_of :currency, :guest_first_name, :guest_last_name, :payment_method, :with => /[a-z]+/i, :presence => true
  validates_format_of :no_of_tickets, :ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :total_ticket_price, :total_fees, :total_actual_ticket_price, :total_organizer_payout, :card_no, :with => /[0-9]+/i, :presence => true
  validates_format_of :guest_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :presence => true
  validates_format_of :guest_contact_no, :with => /[0-9]+/i, :presence => true

  validates_length_of :card_no, minimum: 15, maximum: 16, allow_blank: false

  validates :expiry_date, :order_date, :presence => true
  validate :validate_date
  validate :validate_card

  private

  def validate_date
    Log.debug("Inside validate_date")

    return if expiry_date.blank? || order_date.blank?

    if expiry_date < order_date
      errors.add(:expiry_date, "cannot be less than order date")
    end
  end

  def validate_card
    Log.debug("Inside validate_card")

    return if card_no.blank?

    unless LuhnAlgorithm.new(card_no).valid?
      errors.add :card_no, " is not a valid."
    end
  end
end
