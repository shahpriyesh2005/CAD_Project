class ChangeTotalQuantityToIntInTickets < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :total_quantity, :integer
  end
end
