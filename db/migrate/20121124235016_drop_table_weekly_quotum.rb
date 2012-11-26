class DropTableWeeklyQuotum < ActiveRecord::Migration
  def up
    drop_table :weekly_quota
  end

  def down
    create_table :weekly_quota do |t|
      t.date :start_date
      t.date :end_date
      t.integer :quota
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
