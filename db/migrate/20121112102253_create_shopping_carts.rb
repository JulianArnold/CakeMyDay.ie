class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :customer_id
      t.string :session_id
      t.datetime :cake_required_at
      t.integer :weekly_quota_id
      t.string :special_occasion
      t.string :name_to_appear_on_cake
      t.integer :shopping_cart_status_id
      t.integer :paypal_status_id
      t.text :general_description_from_customer

      t.timestamps
    end
  end
end
