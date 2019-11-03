class Subscription < ApplicationRecord
  belongs_to :user

  USER_NAMES = []
  @users = User.find_by_sql("select users.first_name,users.last_name from users join events on users.id=events.user_id")
  @users.each do |name|
    USER_NAMES << name.first_name.concat(" ").concat(name.last_name)
  end
end
