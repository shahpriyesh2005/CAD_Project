require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "creating a ticket" do
    visit tickets_url
    click_on "New Ticket"

    fill_in "Actual Ticket Price", with: @ticket.actual_ticket_price
    fill_in "Category", with: @ticket.category
    fill_in "Currency", with: @ticket.currency
    fill_in "Description", with: @ticket.description
    fill_in "Event", with: @ticket.event_id
    fill_in "Fees per Ticket", with: @ticket.fees_per_ticket
    fill_in "Include Fees in Ticket Price", with: @ticket.include_fees_in_ticket_price
    fill_in "Max Tickets", with: @ticket.max_tickets
    fill_in "Min Tickets", with: @ticket.min_tickets
    fill_in "Ticket Type", with: @ticket.ticket_type
    fill_in "Organizer Payout per Ticket", with: @ticket.organizer_payout_per_ticket
    fill_in "Sale End Time", with: @ticket.sale_end_time
    fill_in "Sale Start Time", with: @ticket.sale_start_time
    fill_in "Ticket Price", with: @ticket.ticket_price
    fill_in "Total Quantity", with: @ticket.total_quantity
    fill_in "Entry Type", with: @ticket.entry_type
    fill_in "User", with: @ticket.user_id
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "updating a ticket" do
    visit tickets_url
    click_on "Edit", match: :first

    fill_in "Actual Ticket Price", with: @ticket.actual_ticket_price
    fill_in "Category", with: @ticket.category
    fill_in "Currency", with: @ticket.currency
    fill_in "Description", with: @ticket.description
    fill_in "Event", with: @ticket.event_id
    fill_in "Fees per Ticket", with: @ticket.fees_per_ticket
    fill_in "Include Fees in Ticket Price", with: @ticket.include_fees_in_ticket_price
    fill_in "Max Tickets", with: @ticket.max_tickets
    fill_in "Min Tickets", with: @ticket.min_tickets
    fill_in "Ticket Type", with: @ticket.ticket_type
    fill_in "Organizer Payout per Ticket", with: @ticket.organizer_payout_per_ticket
    fill_in "Sale End Time", with: @ticket.sale_end_time
    fill_in "Sale Start Time", with: @ticket.sale_start_time
    fill_in "Ticket Price", with: @ticket.ticket_price
    fill_in "Total Quantity", with: @ticket.total_quantity
    fill_in "Entry Type", with: @ticket.entry_type
    fill_in "User", with: @ticket.user_id
    click_on "Update Ticket"

    assert_text "Ticket was successfully updated"
    click_on "Back"
  end

  test "destroying a ticket" do
    visit tickets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ticket was successfully destroyed"
  end
end
