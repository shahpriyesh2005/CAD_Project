class DropSubscribeNotifyTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :subscription_notifications
  end
end
