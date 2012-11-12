class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :production_quota_value
      t.integer :product_category_id
      t.integer :options_list_id
      t.boolean :pre_configured_product
      t.integer :special_occasion_id
      t.boolean :allow_user_to_choose_quantity
      t.boolean :allow_user_to_enter_description
      t.integer :running_order
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
