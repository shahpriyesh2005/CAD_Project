json.extract! event, :id, :title, :category, :description, :organizer_name, :organizer_email, :organizer_contact_no, :venue, :address1, :address2, :city, :county, :country, :start_date, :start_time, :end_date, :end_time, :publish_date, :publish_time, :reserved_seating, :sponsored, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
