json.extract! notification, :id, :users_id, :events_id, :notify_category, :seen, :created_at, :updated_at
json.url notification_url(notification, format: :json)
