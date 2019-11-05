class AddEventNameToWishlists < ActiveRecord::Migration[6.0]
  def change
    add_column :wishlists, :event_name, :string
  end
end
