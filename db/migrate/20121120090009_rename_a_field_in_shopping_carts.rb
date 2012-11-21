class RenameAFieldInShoppingCarts < ActiveRecord::Migration
  def up
    rename_column :shopping_carts, :weekly_quota_id, :production_quotum_id
  end

  def down
    rename_column :shopping_carts, :production_quotum_id, :weekly_quota_id
  end
end
