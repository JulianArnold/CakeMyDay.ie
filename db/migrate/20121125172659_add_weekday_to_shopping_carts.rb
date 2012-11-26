class AddWeekdayToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :weekday, :integer
  end
end
