# ShoppingCartItem.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class ShoppingCartItem < ActiveRecord::Base
  attr_accessible :cake_id, :product_id, :product_options_list_choice, :product_price_id, :quantity, :global_options_list_choice, :user_description
  
  belongs_to  :product
  belongs_to  :product_price
  belongs_to  :cake
  
  validates_presence_of :cake_id, :product_id, :product_price_id, :quantity
  validates_numericality_of :quantity, :allow_nil => true
  validates_numericality_of :cake_id, :product_id, :product_price_id
  validates_numericality_of :unit_price, :line_total, :allow_nil => true
  
  before_save :update_prices
  
  private
  
  def update_prices
    # look up the unit price for this product
    self.product_price.reload
    the_price = self.product_price.price.to_f
    # store the unit price in the unit_price field
    self.unit_price = the_price
    # store the unit_price * quantity in the line_total field
    self.line_total = the_price * self.quantity
    return true
  end
  
end
