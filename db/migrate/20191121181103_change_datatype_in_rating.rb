class ChangeDatatypeInRating < ActiveRecord::Migration[6.0]
  def change
    change_column :ratings, :user_rating, :decimal
  end
end
