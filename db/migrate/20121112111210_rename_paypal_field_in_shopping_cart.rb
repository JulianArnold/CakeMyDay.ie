class RenamePaypalFieldInShoppingCart < ActiveRecord::Migration
  def up
    rename_column :shopping_carts, :paypal_status_id, :pay_pal_status_id
  end

  def down
    rename_column :shopping_carts, :pay_pal_status_id, :paypal_status_id
  end
end
