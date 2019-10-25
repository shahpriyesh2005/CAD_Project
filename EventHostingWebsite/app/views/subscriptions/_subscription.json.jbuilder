json.extract! subscription, :id, :subscribed_user_id, :subscription_date, :user_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
