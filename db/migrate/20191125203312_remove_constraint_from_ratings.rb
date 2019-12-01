class RemoveConstraintFromRatings < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :user_id
    remove_column :ratings, :event_id
  end
end
