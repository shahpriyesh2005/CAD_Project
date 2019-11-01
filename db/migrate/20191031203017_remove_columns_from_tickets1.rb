class RemoveColumnsFromTickets1 < ActiveRecord::Migration[6.0]
  def change

    remove_column :tickets, :min_tickets, :numeric

    remove_column :tickets, :max_tickets, :numeric
  end
end
