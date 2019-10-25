require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { actual_ticket_price: @order.actual_ticket_price, card_no: @order.card_no, currency: @order.currency, event_id: @order.event_id, expiry_date: @order.expiry_date, fees_per_ticket: @order.fees_per_ticket, guest_contact_no: @order.guest_contact_no, guest_email: @order.guest_email, guest_first_name: @order.guest_first_name, guest_last_name: @order.guest_last_name, no_of_tickets: @order.no_of_tickets, order_date: @order.order_date, organizer_payout_per_ticket: @order.organizer_payout_per_ticket, payment_method: @order.payment_method, ticket_id: @order.ticket_id, ticket_price: @order.ticket_price, total_actual_ticket_price: @order.total_actual_ticket_price, total_fees: @order.total_fees, total_organizer_payout: @order.total_organizer_payout, total_ticket_price: @order.total_ticket_price, user_id: @order.user_id } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { actual_ticket_price: @order.actual_ticket_price, card_no: @order.card_no, currency: @order.currency, event_id: @order.event_id, expiry_date: @order.expiry_date, fees_per_ticket: @order.fees_per_ticket, guest_contact_no: @order.guest_contact_no, guest_email: @order.guest_email, guest_first_name: @order.guest_first_name, guest_last_name: @order.guest_last_name, no_of_tickets: @order.no_of_tickets, order_date: @order.order_date, organizer_payout_per_ticket: @order.organizer_payout_per_ticket, payment_method: @order.payment_method, ticket_id: @order.ticket_id, ticket_price: @order.ticket_price, total_actual_ticket_price: @order.total_actual_ticket_price, total_fees: @order.total_fees, total_organizer_payout: @order.total_organizer_payout, total_ticket_price: @order.total_ticket_price, user_id: @order.user_id } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
