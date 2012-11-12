class CreateGeneralSettings < ActiveRecord::Migration
  def change
    create_table :general_settings do |t|
      t.integer :default_value_for_weekly_production_quota
      t.string :customer_service_email_address
      t.string :customer_service_phone_number
      t.string :aws_bucket_name
      t.string :rbn_number

      t.timestamps
    end
  end
end
