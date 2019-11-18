class AddUniqueIndexToViewedEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :viewed_events, [ :user_id, :event_id ], :unique => true, :name => 'viewed_events_unique_index'
  end
end
