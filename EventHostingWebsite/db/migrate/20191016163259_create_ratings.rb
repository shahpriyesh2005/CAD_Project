class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.numeric :user_rating
      t.string :user_review
      t.date :rating_date
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
