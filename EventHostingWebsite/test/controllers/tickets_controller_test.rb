require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { actual_ticket_price: @ticket.actual_ticket_price, category: @ticket.category, currency: @ticket.currency, description: @ticket.description, event_id: @ticket.event_id, fees_per_ticket: @ticket.fees_per_ticket, include_fees_in_ticket_price: @ticket.include_fees_in_ticket_price, max_tickets: @ticket.max_tickets, min_tickets: @ticket.min_tickets, name: @ticket.name, organizer_payout_per_ticket: @ticket.organizer_payout_per_ticket, sale_end_time: @ticket.sale_end_time, sale_start_time: @ticket.sale_start_time, ticket_price: @ticket.ticket_price, total_quantity: @ticket.total_quantity, type: @ticket.type, user_id: @ticket.user_id } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { actual_ticket_price: @ticket.actual_ticket_price, category: @ticket.category, currency: @ticket.currency, description: @ticket.description, event_id: @ticket.event_id, fees_per_ticket: @ticket.fees_per_ticket, include_fees_in_ticket_price: @ticket.include_fees_in_ticket_price, max_tickets: @ticket.max_tickets, min_tickets: @ticket.min_tickets, name: @ticket.name, organizer_payout_per_ticket: @ticket.organizer_payout_per_ticket, sale_end_time: @ticket.sale_end_time, sale_start_time: @ticket.sale_start_time, ticket_price: @ticket.ticket_price, total_quantity: @ticket.total_quantity, type: @ticket.type, user_id: @ticket.user_id } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
