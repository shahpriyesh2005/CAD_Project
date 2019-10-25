class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :contact_no
      t.string :address1
      t.string :address2
      t.string :city
      t.string :county
      t.string :country
      t.string :interest1
      t.string :interest2
      t.string :interest3
      t.string :interest4
      t.string :interest5

      t.timestamps
    end
  end
end
