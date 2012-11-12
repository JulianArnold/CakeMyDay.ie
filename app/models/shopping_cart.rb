class ShoppingCart < ActiveRecord::Base
  attr_accessible :cake_required_at, :customer_id, :general_description_from_customer, :name_to_appear_on_cake, :pay_pal_status_id, :session_id, :shopping_cart_status_id, :special_occasion, :weekly_quota_id
  
  belongs_to  :customer
  belongs_to  :pay_pal_status
  has_many    :pay_pal_transactions, :order => :created_at
  has_many    :shopping_cart_items, :order => :id
  belongs_to  :shopping_cart_status
  belongs_to  :weekly_quotum
  belongs_to  :creator,
              :class_name => "User",
              :foreign_key => "created_by"
  belongs_to  :updater,
              :class_name => "User",
              :foreign_key => "updated_by"
  
  validates_numericality_of :shopping_cart_status_id
  validates_numericality_of :customer_id
  validates_numericality_of :pay_pal_status_id
  validates_numericality_of :weekly_quota_id
  
end
