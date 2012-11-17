# ShoppingCartStatus.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class ShoppingCartStatus < ActiveRecord::Base
  attr_accessible :name, :description, :active_cart, :chargeback_cart, :paid_cart, :production_complete, :production_started
  
  has_many :shopping_carts
  
  validates_presence_of :name, :description
  validates_uniqueness_of :name
  
  # need a running_order
  
end
