class AddUniqueIndexToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_index :subscriptions, [ :user_id, :subscribed_user_id ], :unique => true, :name => 'subscriptions_unique_index'
  end
end
