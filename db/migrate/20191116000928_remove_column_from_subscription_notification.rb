class RemoveColumnFromSubscriptionNotification < ActiveRecord::Migration[6.0]
  def change

    remove_column :subscription_notifications, :users_id, :string

    remove_column :subscription_notifications, :events_id, :string
  end
end
