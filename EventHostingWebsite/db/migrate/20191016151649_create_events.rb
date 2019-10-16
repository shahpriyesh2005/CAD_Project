class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :description
      t.string :organizer_name
      t.string :organizer_email
      t.string :organizer_contact_no
      t.string :venue
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :country
      t.date :start_date
      t.timestamp :start_time
      t.date :end_date
      t.timestamp :end_time
      t.date :publish_date
      t.timestamp :publish_time
      t.string :reserved_seating
      t.string :sponsored
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
