# FinishedProductIngredient.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 1st December 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class FinishedProductIngredient < ActiveRecord::Base
  attr_accessible :finished_product_id, :product_id, :global_options_list_choice, :product_options_list_choice, :quantity, :user_description
  
  belongs_to :finished_product
  belongs_to :product
  
  validates_numericality_of :finished_product_id, :product_id, :quantity
  
end