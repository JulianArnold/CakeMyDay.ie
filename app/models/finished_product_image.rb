# FinishedProductImage.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 24th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class FinishedProductImage < ActiveRecord::Base
  attr_accessible :finished_product_id, :image_id, :running_order
  
  validates_numericality_of :finished_product_id, :image_id, :running_order
  
  belongs_to :finished_product
  belongs_to :image
  
end