# NEED TO RETHINK THIS MODEL
# When you have five minutes, I'd like to hear what you have in mind.  Julian.

class ProductComponent < ActiveRecord::Base
  attr_accessible :product_id, :component_product_id, :quantity, :running_order
  
  belongs_to  :product
  
  validates_presence_of :product_id, :quantity, :running_order
  
end
