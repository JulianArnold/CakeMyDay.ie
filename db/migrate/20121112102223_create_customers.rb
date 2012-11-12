class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.text :postal_address
      t.string :contact_phone_number

      t.timestamps
    end
  end
end
