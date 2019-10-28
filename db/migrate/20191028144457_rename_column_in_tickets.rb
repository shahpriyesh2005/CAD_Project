class RenameColumnInTickets < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :type, :entry_type
    rename_column :tickets, :name, :ticket_type
  end
end
