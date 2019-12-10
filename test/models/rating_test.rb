require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do_not_save_if_mandatory_fields_are_not_present" do
    rating = Rating.new(user_rating: 2.0,
      rating_date: '2019-11-27',
      users_id: 1)
      assert_equal(false,rating.save,"Mandatory fields are required.")
  end

  test "do_not_save_if_user_review_is_not_present" do
    rating = Rating.new(user_rating: 2.0,
      rating_date: '2019-11-27',
      users_id: 1,
      events_id: 3,
      ticket_id: 2)
      assert_equal(false,rating.save,"User Review is required.")
  end

  test "do_not_save_if_rating_date_is_not_less_than_today" do
    rating = Rating.new(user_rating: 3.0,
      user_review: "Good",
      rating_date: '2019-11-27',
      ticket_id: 2,
      users_id: 1,
      events_id: 3)
      assert_equal(false,rating.save,"Rating Date should not be less than today.")
  end

  test "save_rating" do
    rating = Rating.new(user_rating: 3.0,
      user_review: "Good",
      rating_date: '2019-12-10',
      ticket_id: 2,
      users_id: 1,
      events_id: 3)
      assert_equal(true,rating.save,"Rating saved successfully.")
  end

end
