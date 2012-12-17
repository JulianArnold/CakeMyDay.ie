class RemoveSessionIdFromShoppingCarts < ActiveRecord::Migration
  def up
    remove_column :shopping_carts, :session_id
  end

  def down
    add_column :shopping_carts, :session_id, :string
  end
end
