class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|
      t.integer :shopping_cart_id
      t.integer :product_id
      t.integer :quantity
      t.integer :product_price_id
      t.string :product_options_list_choice
      t.string :global_options_list_choice
      t.string :user_description

      t.timestamps
    end
  end
end
