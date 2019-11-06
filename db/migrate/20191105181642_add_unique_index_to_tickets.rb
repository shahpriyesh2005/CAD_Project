class AddUniqueIndexToTickets < ActiveRecord::Migration[6.0]
  def change
    add_index :tickets, [ :event_id, :entry_type, :ticket_type, :category ], :unique => true, :name => 'tickets_unique_index'
  end
end
