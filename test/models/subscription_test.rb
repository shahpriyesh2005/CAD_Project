require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do_not_save_if_mandatory_fields_are_not_present" do
    subscribe = Subscription.new(subscription_date: '2019-08-20',
      user_id: 1)
      assert_equal(false,subscribe.save,"Subscribed_user_id is required.")
  end

  test "do_not_save_if_subscription_date_is_greater_than_today" do
    subscribe = Subscription.new(subscribed_user_id: 2,
      subscription_date: '2019-12-27',
      user_id: 1)
      assert_equal(false,subscribe.save,"Subscription_date should be equal to today's date.")
  end

  test "save" do
    subscribe = Subscription.new(subscribed_user_id: 2,
      subscription_date: '2019-12-10',
      user_id: 1)
      assert_equal(true,subscribe.save,"Saved Successfully.")
  end

end
