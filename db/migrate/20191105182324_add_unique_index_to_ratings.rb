class AddUniqueIndexToRatings < ActiveRecord::Migration[6.0]
  def change
    add_index :ratings, [ :user_id, :event_id ], :unique => true, :name => 'ratings_unique_index'
  end
end
