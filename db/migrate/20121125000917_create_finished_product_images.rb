class CreateFinishedProductImages < ActiveRecord::Migration
  def change
    create_table :finished_product_images do |t|
      t.integer :finished_product_id
      t.integer :image_id
      t.integer :running_order

      t.timestamps
    end
  end
end
