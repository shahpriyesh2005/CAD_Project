require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Actual ticket price", with: @order.actual_ticket_price
    fill_in "Card no", with: @order.card_no
    fill_in "Currency", with: @order.currency
    fill_in "Event", with: @order.event_id
    fill_in "Expiry date", with: @order.expiry_date
    fill_in "Fees per ticket", with: @order.fees_per_ticket
    fill_in "Guest contact no", with: @order.guest_contact_no
    fill_in "Guest email", with: @order.guest_email
    fill_in "Guest first name", with: @order.guest_first_name
    fill_in "Guest last name", with: @order.guest_last_name
    fill_in "No of tickets", with: @order.no_of_tickets
    fill_in "Order date", with: @order.order_date
    fill_in "Organizer payout per ticket", with: @order.organizer_payout_per_ticket
    fill_in "Payment method", with: @order.payment_method
    fill_in "Ticket", with: @order.ticket_id
    fill_in "Ticket price", with: @order.ticket_price
    fill_in "Total actual ticket price", with: @order.total_actual_ticket_price
    fill_in "Total fees", with: @order.total_fees
    fill_in "Total organizer payout", with: @order.total_organizer_payout
    fill_in "Total ticket price", with: @order.total_ticket_price
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Actual ticket price", with: @order.actual_ticket_price
    fill_in "Card no", with: @order.card_no
    fill_in "Currency", with: @order.currency
    fill_in "Event", with: @order.event_id
    fill_in "Expiry date", with: @order.expiry_date
    fill_in "Fees per ticket", with: @order.fees_per_ticket
    fill_in "Guest contact no", with: @order.guest_contact_no
    fill_in "Guest email", with: @order.guest_email
    fill_in "Guest first name", with: @order.guest_first_name
    fill_in "Guest last name", with: @order.guest_last_name
    fill_in "No of tickets", with: @order.no_of_tickets
    fill_in "Order date", with: @order.order_date
    fill_in "Organizer payout per ticket", with: @order.organizer_payout_per_ticket
    fill_in "Payment method", with: @order.payment_method
    fill_in "Ticket", with: @order.ticket_id
    fill_in "Ticket price", with: @order.ticket_price
    fill_in "Total actual ticket price", with: @order.total_actual_ticket_price
    fill_in "Total fees", with: @order.total_fees
    fill_in "Total organizer payout", with: @order.total_organizer_payout
    fill_in "Total ticket price", with: @order.total_ticket_price
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
