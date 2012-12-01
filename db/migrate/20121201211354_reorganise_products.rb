class ReorganiseProducts < ActiveRecord::Migration
  def up
    remove_column :products, :pre_configured_product
  end

  def down
    add_coumn :products, :pre_configured_product, :boolean
  end
end
