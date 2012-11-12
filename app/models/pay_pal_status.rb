class PayPalStatus < ActiveRecord::Base
  attr_accessible :charged_back, :description, :name, :paid_sale, :pending_authorisation
  
  has_many :pay_pal_transactions
  
  validates_presence_of :name, :description
  validates_uniqueness_of :name
  
end
