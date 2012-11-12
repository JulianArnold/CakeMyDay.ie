class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.integer :product_id
      t.datetime :start_at
      t.datetime :finish_at
      t.integer :currency_id
      t.decimal :price
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
