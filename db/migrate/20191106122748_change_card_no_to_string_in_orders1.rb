class ChangeCardNoToStringInOrders1 < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :card_no, :string
  end
end
