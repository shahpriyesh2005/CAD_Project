class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.numeric :no_of_tickets
      t.numeric :ticket_price
      t.numeric :fees_per_ticket
      t.numeric :actual_ticket_price
      t.numeric :organizer_payout_per_ticket
      t.numeric :total_ticket_price
      t.numeric :total_fees
      t.numeric :total_actual_ticket_price
      t.numeric :total_organizer_payout
      t.string :currency
      t.string :guest_first_name
      t.string :guest_last_name
      t.string :guest_email
      t.string :guest_contact_no
      t.string :payment_method
      t.numeric :card_no
      t.date :expiry_date
      t.date :order_date
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
