class AddConstraintOnTickets < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE TICKETS ADD CONSTRAINT TICKETS_CK1 CHECK (AVAILABLE_QUANTITY >= 0)"
  end
end
