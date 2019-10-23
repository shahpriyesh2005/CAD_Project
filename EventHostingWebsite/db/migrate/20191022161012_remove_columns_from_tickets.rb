class RemoveColumnsFromTickets < ActiveRecord::Migration[6.0]
  def change

    remove_column :tickets, :sale_start_date, :date

    remove_column :tickets, :sale_end_date, :date
  end
end
