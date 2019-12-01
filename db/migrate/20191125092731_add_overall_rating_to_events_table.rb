class AddOverallRatingToEventsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :overall_rating, :decimal
  end
end
