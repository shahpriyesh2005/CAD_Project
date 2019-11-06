class AddUniqueIndexToWishlists < ActiveRecord::Migration[6.0]
  def change
    add_index :wishlists, [ :user_id, :event_id ], :unique => true, :name => 'wishlists_unique_index'
  end
end
