json.extract! event, :id, :picture, :title, :category, :description, :organizer_name, :organizer_email, :organizer_contact_no, :venue, :address1, :address2, :city, :county, :country, :start_time, :end_time, :publish_time, :reserved_seating, :sponsored, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
