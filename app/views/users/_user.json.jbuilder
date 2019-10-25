json.extract! user, :id, :first_name, :last_name, :gender, :email, :contact_no, :address1, :address2, :city, :county, :country, :interest1, :interest2, :interest3, :interest4, :interest5, :created_at, :updated_at
json.url user_url(user, format: :json)
