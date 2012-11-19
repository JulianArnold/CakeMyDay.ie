class AddRunningOrderToShoppingCartStatuses < ActiveRecord::Migration
  def change
    add_column :shopping_cart_statuses, :running_order, :integer
  end
end
