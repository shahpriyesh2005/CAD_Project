class RemoveColumnsFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :start_date, :date

    remove_column :events, :end_date, :date

    remove_column :events, :publish_date, :date
  end
end
