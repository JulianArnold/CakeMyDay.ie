class CreateShoppingCartStatuses < ActiveRecord::Migration
  def change
    create_table :shopping_cart_statuses do |t|
      t.string :name
      t.text :description
      t.boolean :active_cart
      t.boolean :paid_cart
      t.boolean :chargeback_cart
      t.boolean :production_started
      t.boolean :production_complete

      t.timestamps
    end
  end
end
