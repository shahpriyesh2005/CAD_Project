class ChangeNoOfTicketsToIntInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :no_of_tickets, :integer
  end
end
