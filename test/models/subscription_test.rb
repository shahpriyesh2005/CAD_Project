require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "do_not_save_if_subscribed_user_id_is_not_present" do
    subscribe = Subscription.new(subscription_date: '2019-08-20',
      user_id: 1)
      assert_equal(false,subscribe.save,"Subscribed_user_id is requiredt")
  end

end
