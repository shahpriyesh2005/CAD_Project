require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a Ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Actual ticket price", with: @ticket.actual_ticket_price
    fill_in "Category", with: @ticket.category
    fill_in "Currency", with: @ticket.currency
    fill_in "Description", with: @ticket.description
    fill_in "Event", with: @ticket.event_id
    fill_in "Fees per ticket", with: @ticket.fees_per_ticket
    fill_in "Include fees in ticket price", with: @ticket.include_fees_in_ticket_price
    fill_in "Max tickets", with: @ticket.max_tickets
    fill_in "Min tickets", with: @ticket.min_tickets
    fill_in "Name", with: @ticket.name
    fill_in "Organizer payout per ticket", with: @ticket.organizer_payout_per_ticket
    fill_in "Sale end date", with: @ticket.sale_end_date
    fill_in "Sale end time", with: @ticket.sale_end_time
    fill_in "Sale start date", with: @ticket.sale_start_date
    fill_in "Sale start time", with: @ticket.sale_start_time
    fill_in "Ticket price", with: @ticket.ticket_price
    fill_in "Total quantity", with: @ticket.total_quantity
    fill_in "Type", with: @ticket.type
    fill_in "User", with: @ticket.user_id
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a Ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Actual ticket price", with: @ticket.actual_ticket_price
    fill_in "Category", with: @ticket.category
    fill_in "Currency", with: @ticket.currency
    fill_in "Description", with: @ticket.description
    fill_in "Event", with: @ticket.event_id
    fill_in "Fees per ticket", with: @ticket.fees_per_ticket
    fill_in "Include fees in ticket price", with: @ticket.include_fees_in_ticket_price
    fill_in "Max tickets", with: @ticket.max_tickets
    fill_in "Min tickets", with: @ticket.min_tickets
    fill_in "Name", with: @ticket.name
    fill_in "Organizer payout per ticket", with: @ticket.organizer_payout_per_ticket
    fill_in "Sale end date", with: @ticket.sale_end_date
    fill_in "Sale end time", with: @ticket.sale_end_time
    fill_in "Sale start date", with: @ticket.sale_start_date
    fill_in "Sale start time", with: @ticket.sale_start_time
    fill_in "Ticket price", with: @ticket.ticket_price
    fill_in "Total quantity", with: @ticket.total_quantity
    fill_in "Type", with: @ticket.type
    fill_in "User", with: @ticket.user_id
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a Ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
