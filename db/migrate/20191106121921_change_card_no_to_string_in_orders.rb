class ChangeCardNoToStringInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :no_of_tickets, :string
  end
end
