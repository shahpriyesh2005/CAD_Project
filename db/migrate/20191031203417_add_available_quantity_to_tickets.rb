class AddAvailableQuantityToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :available_quantity, :numeric
  end
end
