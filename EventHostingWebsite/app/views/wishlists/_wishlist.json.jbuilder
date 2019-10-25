json.extract! wishlist, :id, :wishlist_date, :user_id, :event_id, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
