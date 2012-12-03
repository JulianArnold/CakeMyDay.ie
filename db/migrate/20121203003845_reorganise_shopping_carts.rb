class ReorganiseShoppingCarts < ActiveRecord::Migration
  def up
    remove_column :shopping_carts, :cake_required_at
    remove_column :shopping_carts, :production_quotum_id
    remove_column :shopping_carts, :special_occasion
    remove_column :shopping_carts, :name_to_appear_on_cake
    remove_column :shopping_carts, :general_description_from_customer
    remove_column :shopping_carts, :weekday
  end

  def down
    add_column :shopping_carts, :cake_required_at, :datetime
    add_column :shopping_carts, :production_quotum_id, :integer
    add_column :shopping_carts, :special_occasion, :string
    add_column :shopping_carts, :name_to_appear_on_cake, :string
    add_column :shopping_carts, :general_description_from_customer, :text
    add_column :shopping_carts, :weekday, :integer
  end
end
