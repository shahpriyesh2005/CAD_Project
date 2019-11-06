class AddUniqueIndexToEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :events, [ :title, :category ], :unique => true, :name => 'events_unique_index'
  end
end
