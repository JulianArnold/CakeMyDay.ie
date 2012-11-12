class CreateSpecialOccasions < ActiveRecord::Migration
  def change
    create_table :special_occasions do |t|
      t.string :name
      t.integer :running_order
      t.boolean :visible_to_customers

      t.timestamps
    end
  end
end
