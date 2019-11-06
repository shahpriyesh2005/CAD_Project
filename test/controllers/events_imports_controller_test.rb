require 'test_helper'

class EventsImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get events_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get events_imports_create_url
    assert_response :success
  end

end
