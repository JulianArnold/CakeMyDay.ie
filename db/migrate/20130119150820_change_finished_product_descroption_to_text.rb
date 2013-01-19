class ChangeFinishedProductDescroptionToText < ActiveRecord::Migration
  def up
    change_column :finished_products, :description, :text, :limit => nil
  end

  def down
    change_column :finished_products, :description, :string
  end
end
