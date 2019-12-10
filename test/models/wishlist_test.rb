require 'test_helper'

class WishlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do_not_save_if_mandatory_fields_are_missing" do
    wishlist = Wishlist.new(user_id: 3,
      event_id: 4)
      assert_equal(false,wishlist.save,"Mandatory fields are required.")
  end

  test "do_not_save_if_user_id_is_missing" do
    wishlist = Wishlist.new(wishlist_date: '2019-12-10',
      event_id: 4)
      assert_equal(false,wishlist.save,"User ID is required.")
  end

  test "do_not_save_if_event_id_is_missing" do
    wishlist = Wishlist.new(wishlist_date: '2019-12-10',
      user_id: 4)
      assert_equal(false,wishlist.save,"Event ID is required.")
  end

  test "do_not_save_if_wishlist_date_is_greater" do
    wishlist = Wishlist.new(wishlist_date: '2019-12-13',
      user_id: 2,
      event_id: 4)
      assert_equal(false,wishlist.save,"Wishlist Date cannot be greater than today.")
  end

  test "save" do
    wishlist = Wishlist.new(wishlist_date: '2019-12-10',
      user_id: 2,
      event_id: 4)
      assert_equal(true,wishlist.save,"Data saved successfully.")
  end
end
