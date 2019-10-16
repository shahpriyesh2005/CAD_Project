require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:one)
  end

  test "should get index" do
    get ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_rating_url
    assert_response :success
  end

  test "should create rating" do
    assert_difference('Rating.count') do
      post ratings_url, params: { rating: { event_id: @rating.event_id, rating_date: @rating.rating_date, ticket_id: @rating.ticket_id, user_id: @rating.user_id, user_rating: @rating.user_rating, user_review: @rating.user_review } }
    end

    assert_redirected_to rating_url(Rating.last)
  end

  test "should show rating" do
    get rating_url(@rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_rating_url(@rating)
    assert_response :success
  end

  test "should update rating" do
    patch rating_url(@rating), params: { rating: { event_id: @rating.event_id, rating_date: @rating.rating_date, ticket_id: @rating.ticket_id, user_id: @rating.user_id, user_rating: @rating.user_rating, user_review: @rating.user_review } }
    assert_redirected_to rating_url(@rating)
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete rating_url(@rating)
    end

    assert_redirected_to ratings_url
  end
end
