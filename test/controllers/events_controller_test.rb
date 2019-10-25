require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { address1: @event.address1, address2: @event.address2, category: @event.category, city: @event.city, country: @event.country, county: @event.county, description: @event.description, end_time: @event.end_time, organizer_contact_no: @event.organizer_contact_no, organizer_email: @event.organizer_email, organizer_name: @event.organizer_name, publish_time: @event.publish_time, reserved_seating: @event.reserved_seating, sponsored: @event.sponsored, start_time: @event.start_time, title: @event.title, user_id: @event.user_id, venue: @event.venue } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { address1: @event.address1, address2: @event.address2, category: @event.category, city: @event.city, country: @event.country, county: @event.county, description: @event.description, end_time: @event.end_time, organizer_contact_no: @event.organizer_contact_no, organizer_email: @event.organizer_email, organizer_name: @event.organizer_name, publish_time: @event.publish_time, reserved_seating: @event.reserved_seating, sponsored: @event.sponsored, start_time: @event.start_time, title: @event.title, user_id: @event.user_id, venue: @event.venue } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
