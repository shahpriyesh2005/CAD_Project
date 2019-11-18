class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :users, null: false, foreign_key: true
      t.references :events, null: false, foreign_key: true
      t.string :notify_category
      t.boolean :seen

      t.timestamps
    end
  end
end
