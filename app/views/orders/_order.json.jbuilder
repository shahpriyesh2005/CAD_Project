json.extract! order, :id, :no_of_tickets, :ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :total_ticket_price, :total_fees, :total_actual_ticket_price, :total_organizer_payout, :currency, :guest_first_name, :guest_last_name, :guest_email, :guest_contact_no, :payment_method, :card_no, :expiry_date, :order_date, :user_id, :event_id, :ticket_id, :created_at, :updated_at
json.url order_url(order, format: :json)