class ShoppingCartStatus < ActiveRecord::Base
  attr_accessible :name, :description, :active_cart, :chargeback_cart, :paid_cart, :production_complete, :production_started
  
  has_many :shopping_carts
  
  validates_presence_of :name, :description
  validates_uniqueness_of :name
  
  # need a running_order
  
end
