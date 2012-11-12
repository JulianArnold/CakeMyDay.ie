class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :name
      t.text :description
      t.boolean :one_choice_only
      t.integer :running_order
      t.integer :options_list_id

      t.timestamps
    end
  end
end
