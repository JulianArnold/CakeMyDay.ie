# FinishedProduct.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 24th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class FinishedProduct < ActiveRecord::Base
  attr_accessible :product_name, :description, :typical_price, :special_occasion_id, :running_order, :available_for_purchase, :visible, :created_at
  
  belongs_to :special_occasion
  has_many   :finished_product_images, :order => "running_order"
  
  validates_presence_of :product_name, :description, :typical_price, :running_order
  validates_uniqueness_of :product_name
  validates_numericality_of :running_order
  validates_numericality_of :typical_price
  
end
