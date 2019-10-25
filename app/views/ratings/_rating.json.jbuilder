json.extract! rating, :id, :user_rating, :user_review, :rating_date, :user_id, :event_id, :ticket_id, :created_at, :updated_at
json.url rating_url(rating, format: :json)
