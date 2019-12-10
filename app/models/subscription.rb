class Subscription < ApplicationRecord
  belongs_to :user

    USER_NAMES = []
    #@users = User.find_by_sql("select users.first_name,users.last_name from users join events on users.id=events.user_id")
    #@users.each do |name|
        #USER_NAMES << name.first_name + ' ' + name.last_name

    #end     #end of each loop
    validates :subscription_date,:subscribed_user_id,:user_id, :presence => true
    validate :check_subscription_date
  
    private
  
    def check_subscription_date
      return if subscription_date.blank?
  
      if subscription_date.strftime("%Y-%m-%d %H:%M:%S") < Time.now.strftime("%Y-%m-%d %H:%M:%S")
        errors.add(:subscription_date, "should be greater than current time")
      end
  
end   #end of Model
