class CreateFinishedProducts < ActiveRecord::Migration
  def change
    create_table :finished_products do |t|
      t.string :product_name
      t.string :description
      t.decimal :typical_price
      t.integer :special_occasion_id
      t.integer :running_order
      t.boolean :available_for_purchase
      t.boolean :visible

      t.timestamps
    end
  end
end
