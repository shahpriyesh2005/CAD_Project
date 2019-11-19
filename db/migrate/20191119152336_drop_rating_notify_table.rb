class DropRatingNotifyTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :rating_notifications
  end
end
