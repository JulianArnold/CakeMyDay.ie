class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.integer :shopping_cart_id
      t.datetime :cake_required_at
      t.integer :production_quotum_id
      t.string :special_occasion
      t.string :name_to_appear_on_cake
      t.text :general_description_from_customer
      t.text :confectioners_notes
      t.integer :weekday
      t.integer :based_on_finished_product_id

      t.timestamps
    end
  end
end
