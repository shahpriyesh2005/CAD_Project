json.extract! wishlist, :id, :wishlist_date, :user_id, :event_id, :created_at, :updated_at, :event_name
json.url wishlist_url(wishlist, format: :json)
