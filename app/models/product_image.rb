class ProductImage < ActiveRecord::Base
  attr_accessible :image_id, :product_id, :running_order
  
  belongs_to :image
  belongs_to :product
  
  validates_presence_of :image_id, :product_id, :running_order
  validates_numericality_of :image_id, :product_id, :running_order
  
end
