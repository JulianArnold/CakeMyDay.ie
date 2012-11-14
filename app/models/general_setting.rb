class GeneralSetting < ActiveRecord::Base
  attr_accessible #:aws_bucket_name, :customer_service_email_address, :customer_service_phone_number, :default_value_for_weekly_production_quota, :rbn_number
  
  validates_presence_of :aws_bucket_name, :customer_service_email_address, :customer_service_phone_number, :default_value_for_weekly_production_quota, :rbn_number, :default_currency_id
  
  belongs_to  :currency,
              :class_name => "Currency",
              :foreign_key => "default_currency_id"
  
end
