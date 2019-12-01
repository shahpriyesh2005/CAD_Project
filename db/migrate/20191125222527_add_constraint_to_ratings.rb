class AddConstraintToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :users
    add_reference :ratings, :events
  end
end
