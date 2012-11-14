class Currency < ActiveRecord::Base
  attr_accessible :active, :currency_symbol, :full_name, :iso_code, :running_order
  
  has_many :pay_pal_transactions
  has_many :product_prices
  has_one  :general_setting,
           :class_name => "GeneralSetting",
           :foreign_key => "default_currency_id"
  
  validates_presence_of :currency_symbol, :full_name, :iso_code, :running_order
  validates_uniqueness_of :iso_code
  validates_uniqueness_of :full_name

end
