class RemoveColumnsFromViewedEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :viewed_events, :event_category, :string

    remove_column :viewed_events, :created_at, :datetime

    remove_column :viewed_events, :updated_at, :datetime
  end
end
