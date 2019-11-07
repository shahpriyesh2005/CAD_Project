class ChangeAvailableQuantityToIntInTickets < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :available_quantity, :integer
  end
end
