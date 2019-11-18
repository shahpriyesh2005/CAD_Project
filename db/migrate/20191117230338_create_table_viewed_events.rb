class CreateTableViewedEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :viewed_events do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :event_category
      t.timestamp :view_time

      t.timestamps
    end
  end
end
