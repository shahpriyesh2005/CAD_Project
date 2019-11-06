class ChangeNoOfTicketsToIntInOrders1 < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :no_of_tickets, 'integer USING CAST(no_of_tickets AS integer)'
  end
end
