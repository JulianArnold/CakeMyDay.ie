class ReorganiseShoppingCartItems < ActiveRecord::Migration
  def up
    rename_column :shopping_cart_items, :shopping_cart_id, :cake_id
  end

  def down
    rename_column :shopping_cart_items, :cake_id, :shopping_cart_id
  end
end
