class CreateOptionsLists < ActiveRecord::Migration
  def change
    create_table :options_lists do |t|
      t.string :name
      t.string :visible_label
      t.text :options

      t.timestamps
    end
  end
end
