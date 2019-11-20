class AddConstraintOnRatings < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE RATINGS ADD CONSTRAINT RATINGS_CK1 CHECK (USER_RATING > 0)"
  end
end
