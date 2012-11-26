class AddPricingFieldsToShoppingCartItems < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :unit_price, :decimal
    add_column :shopping_cart_items, :line_total, :decimal
  end
end
