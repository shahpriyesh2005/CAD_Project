require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do not save ticket when any of the mandatory parameter is missing" do
    event = Ticket.new(entry_type: "Paid")
    puts event.attributes
    assert_equal(false, event.save, "saved the ticket even when any of the mandatory parameter is missing")
  end

  test "do not save ticket when any of the amounts are not in proper format" do
    ticket = Ticket.new(entry_type: "Paid",
                        ticket_type: "General",
                        category: "Refundable",
                        description: "Ticket1 Ticket1 Ticket1",
                        total_quantity: "ABC",
                        ticket_price: "ABC",
                        include_fees_in_ticket_price: "Yes",
                        fees_per_ticket: "ABC",
                        actual_ticket_price: "ABC",
                        organizer_payout_per_ticket: "ABC",
                        sale_start_time: Time.now,
                        sale_end_time: Time.now,
                        currency: "Euro",
                        user_id: 1,
                        event_id: 1,
                        created_at: Time.now,
                        updated_at: Time.now,
                        available_quantity: "ABC")
    puts ticket.attributes
    assert_equal(false, ticket.save, "saved the ticket even when any of the amounts are not in proper format")
  end

  test "do not save ticket when description data length is less than required" do
    ticket = Ticket.new(entry_type: "Paid",
                        ticket_type: "General",
                        category: "Refundable",
                        description: "Ticket1",
                        total_quantity: 100,
                        ticket_price: 100,
                        include_fees_in_ticket_price: "Yes",
                        fees_per_ticket: 10,
                        actual_ticket_price: 90,
                        organizer_payout_per_ticket: 10,
                        sale_start_time: Time.now,
                        sale_end_time: Time.now,
                        currency: "Euro",
                        user_id: 1,
                        event_id: 1,
                        created_at: Time.now,
                        updated_at: Time.now,
                        available_quantity: 100)
    puts ticket.attributes
    assert_equal(false, ticket.save, "saved the ticket even when description data length is less than required")
  end

  test "do not save ticket when date is missing" do
    ticket = Ticket.new(entry_type: "Paid",
                        ticket_type: "General",
                        category: "Refundable",
                        description: "Ticket1 Ticket1 Ticket1",
                        total_quantity: 100,
                        ticket_price: 100,
                        include_fees_in_ticket_price: "Yes",
                        fees_per_ticket: 10,
                        actual_ticket_price: 90,
                        organizer_payout_per_ticket: 10,
                        # sale_start_time: Time.now,
                        # sale_end_time: Time.now,
                        currency: "Euro",
                        user_id: 1,
                        event_id: 1,
                        created_at: Time.now,
                        updated_at: Time.now,
                        available_quantity: 100)
    puts ticket.attributes
    assert_equal(false, ticket.save, "saved the ticket even when date is missing")
  end

  test "do not save ticket when date validation fails" do
    ticket = Ticket.new(entry_type: "Paid",
                        ticket_type: "General",
                        category: "Refundable",
                        description: "Ticket1 Ticket1 Ticket1",
                        total_quantity: 100,
                        ticket_price: 100,
                        include_fees_in_ticket_price: "Yes",
                        fees_per_ticket: 10,
                        actual_ticket_price: 90,
                        organizer_payout_per_ticket: 10,
                        sale_start_time: "30-Nov-2019 00:00:00",
                        sale_end_time: "30-Nov-2019 00:00:00",
                        currency: "Euro",
                        user_id: 1,
                        event_id: 1,
                        created_at: Time.now,
                        updated_at: Time.now,
                        available_quantity: 100)
    puts ticket.attributes
    assert_equal(false, ticket.save, "saved the ticket even when date validation fails")
  end

  test "save ticket" do
    ticket = Ticket.new(entry_type: "Paid",
                        ticket_type: "General",
                        category: "Refundable",
                        description: "Ticket1 Ticket1 Ticket1",
                        total_quantity: 100,
                        ticket_price: 100.0,
                        include_fees_in_ticket_price: "Yes",
                        fees_per_ticket: 10.0,
                        actual_ticket_price: 90.0,
                        organizer_payout_per_ticket: 10.0,
                        sale_start_time: "30-Dec-2019 00:00:00",
                        sale_end_time: "31-Dec-2019 00:00:00",
                        currency: "Euro",
                        user_id: 1,
                        event_id: 1,
                        created_at: Time.now,
                        updated_at: Time.now,
                        available_quantity: 100)
    puts ticket.attributes
    assert_equal(true, ticket.save, "did not save the ticket")
  end
end
