class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :bucket_name
      t.string :content_type
      t.integer :file_size
      t.boolean :finished_product
      t.boolean :base_product
      t.integer :uploaded_by

      t.timestamps
    end
  end
end
