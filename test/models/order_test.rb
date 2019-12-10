require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do not save order when any of the mandatory parameter is missing" do
    order = Order.new(guest_first_name: "Priyesh")
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when any of the mandatory parameter is missing")
  end

  test "do not save order when any of the amounts are not in proper format" do
    order = Order.new(no_of_tickets: "ABC",
                      ticket_price: "ABC",
                      fees_per_ticket: "ABC",
                      actual_ticket_price: "ABC",
                      organizer_payout_per_ticket: "ABC",
                      total_ticket_price: "ABC",
                      total_fees: "ABC",
                      total_actual_ticket_price: "ABC",
                      total_organizer_payout: "ABC",
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 1234567890123456,
                      expiry_date: Time.now,
                      order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when any of the amounts are not in proper format")
  end

  test "do not save order when guest email is not in proper format" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 1234567890123456,
                      expiry_date: Time.now,
                      order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when guest email is not in proper format")
  end

  test "do not save order when guest contact no is not in proper format" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 12345,
                      payment_method: "Debit Card",
                      card_no: 1234567890123456,
                      expiry_date: Time.now,
                      order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when guest contact no is not in proper format")
  end

  test "do not save order when card no data length is less than required" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 1234567890,
                      expiry_date: Time.now,
                      order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when card no data length is less than required")
  end

  test "do not save order when date is missing" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 1234567890123456,
                      # expiry_date: Time.now,
                      # order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when date is missing")
  end

  test "do not save order when date validation fails" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 1234567890123456,
                      expiry_date: "31-Oct-2019",
                      order_date: "30-Nov-2019",
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when date validation fails")
  end

  test "do not save order when card validation fails" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 1234567890123456,
                      expiry_date: Time.now,
                      order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(false, order.save, "saved the order even when card validation fails")
  end

  test "save order" do
    order = Order.new(no_of_tickets: 1,
                      ticket_price: 100.0,
                      fees_per_ticket: 10.0,
                      actual_ticket_price: 90.0,
                      organizer_payout_per_ticket: 10.0,
                      total_ticket_price: 100.0,
                      total_fees: 10.0,
                      total_actual_ticket_price: 90.0,
                      total_organizer_payout: 10.0,
                      currency: "Euro",
                      guest_first_name: "Priyesh",
                      guest_last_name: "Shah",
                      guest_email: "abc@gmail.com",
                      guest_contact_no: 1234567890,
                      payment_method: "Debit Card",
                      card_no: 4807055077319532,
                      expiry_date: Time.now,
                      order_date: Time.now,
                      user_id: 1,
                      event_id: 1,
                      ticket_id: 1,
                      created_at: Time.now,
                      updated_at: Time.now,)
    puts order.attributes
    assert_equal(true, order.save, "did not save the order")
  end
end
