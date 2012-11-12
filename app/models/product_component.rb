# NEED TO RETHINK THIS MODEL

class ProductComponent < ActiveRecord::Base
  attr_accessible :product_id, :component_product_id, :quantity, :running_order
  
  belongs_to  :product
  
  validates_presence_of :product_id, :quantity, :running_order
  
end
