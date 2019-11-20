class AddConstraintOnOrders < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK1 CHECK (NO_OF_TICKETS > 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK2 CHECK (TICKET_PRICE >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK3 CHECK (FEES_PER_TICKET >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK4 CHECK (ACTUAL_TICKET_PRICE >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK5 CHECK (ORGANIZER_PAYOUT_PER_TICKET >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK6 CHECK (TOTAL_TICKET_PRICE >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK7 CHECK (TOTAL_FEES >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK8 CHECK (TOTAL_ACTUAL_TICKET_PRICE >= 0)"
    execute "ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_CK9 CHECK (TOTAL_ORGANIZER_PAYOUT >= 0)"
  end
end
