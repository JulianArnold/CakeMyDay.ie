class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.integer :image_id
      t.integer :running_order

      t.timestamps
    end
  end
end
