class CreateFinishedProductIngredients < ActiveRecord::Migration
  def change
    create_table :finished_product_ingredients do |t|
      t.integer :finished_product_id
      t.integer :product_id
      t.integer :quantity
      t.string :product_options_list_choice
      t.string :global_options_list_choice
      t.string :user_description

      t.timestamps
    end
  end
end
