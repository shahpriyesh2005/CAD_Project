json.extract! ticket, :id, :entry_type, :ticket_type, :category, :description, :total_quantity, :ticket_price, :include_fees_in_ticket_price, :fees_per_ticket, :actual_ticket_price, :organizer_payout_per_ticket, :sale_start_time, :sale_end_time, :min_tickets, :max_tickets, :currency, :user_id, :event_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
