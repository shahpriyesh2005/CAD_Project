class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :type
      t.string :name
      t.string :category
      t.string :description
      t.numeric :total_quantity
      t.numeric :ticket_price
      t.string :include_fees_in_ticket_price
      t.numeric :fees_per_ticket
      t.numeric :actual_ticket_price
      t.numeric :organizer_payout_per_ticket
      t.date :sale_start_date
      t.timestamp :sale_start_time
      t.date :sale_end_date
      t.timestamp :sale_end_time
      t.numeric :min_tickets
      t.numeric :max_tickets
      t.string :currency
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
