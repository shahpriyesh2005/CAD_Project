class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscribed_user_id
      t.date :subscription_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
