class CreateProductionQuota < ActiveRecord::Migration
  def change
    create_table :production_quota do |t|
      t.date :start_date
      t.date :finish_date
      t.integer :maximum_cakes_allowed

      t.timestamps
    end
  end
end
