require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Address1", with: @event.address1
    fill_in "Address2", with: @event.address2
    fill_in "Category", with: @event.category
    fill_in "City", with: @event.city
    fill_in "Country", with: @event.country
    fill_in "County", with: @event.county
    fill_in "Description", with: @event.description
    fill_in "End date", with: @event.end_date
    fill_in "End time", with: @event.end_time
    fill_in "Organizer contact no", with: @event.organizer_contact_no
    fill_in "Organizer email", with: @event.organizer_email
    fill_in "Organizer name", with: @event.organizer_name
    fill_in "Publish date", with: @event.publish_date
    fill_in "Publish time", with: @event.publish_time
    fill_in "Reserved seating", with: @event.reserved_seating
    fill_in "Sponsored", with: @event.sponsored
    fill_in "Start date", with: @event.start_date
    fill_in "Start time", with: @event.start_time
    fill_in "Title", with: @event.title
    fill_in "User", with: @event.user_id
    fill_in "Venue", with: @event.venue
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @event.address1
    fill_in "Address2", with: @event.address2
    fill_in "Category", with: @event.category
    fill_in "City", with: @event.city
    fill_in "Country", with: @event.country
    fill_in "County", with: @event.county
    fill_in "Description", with: @event.description
    fill_in "End date", with: @event.end_date
    fill_in "End time", with: @event.end_time
    fill_in "Organizer contact no", with: @event.organizer_contact_no
    fill_in "Organizer email", with: @event.organizer_email
    fill_in "Organizer name", with: @event.organizer_name
    fill_in "Publish date", with: @event.publish_date
    fill_in "Publish time", with: @event.publish_time
    fill_in "Reserved seating", with: @event.reserved_seating
    fill_in "Sponsored", with: @event.sponsored
    fill_in "Start date", with: @event.start_date
    fill_in "Start time", with: @event.start_time
    fill_in "Title", with: @event.title
    fill_in "User", with: @event.user_id
    fill_in "Venue", with: @event.venue
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
