class RemoveColumnFromRatingNotification < ActiveRecord::Migration[6.0]
  def change

    remove_column :rating_notifications, :users_id, :string

    remove_column :rating_notifications, :events_id, :string
  end
end
