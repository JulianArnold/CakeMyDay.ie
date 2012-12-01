# Product.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
# Modified by Julian Arnold (12111333) starting 12th November 2012.
#
# Note 1  Search attribute based on code demonstrated by Wesley Gorman
#         in NCI lecture, and subsequently modified by Dan Laffan.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class Product < ActiveRecord::Base
	  attr_accessible :name, :description, :allow_user_to_choose_quantity, :allow_user_to_enter_description, :options_list_id, :product_category_id, :production_quota_value, :running_order, :special_occasion_id, :created_by, :updated_by
	
	# See note 1 above
	def self.search(search_query)
		if search_query
			find(:all, :conditions => ['name LIKE ? or description LIKE ?', "%" + search_query + "%", "%" + search_query + "%"])
		else
			find (:all)
		end 
	end

  belongs_to  :options_list
  belongs_to  :product_category
  has_many    :product_components
  has_many    :product_images
  has_many    :product_prices
  has_one     :current_price,
              :class_name => "ProductPrice",
              :foreign_key => "product_price_id",
              :order => "start_at ASC",
              :conditions => ["start_at >= :today and (finish_at IS NULL or finish_at <= :today)", {:today => Time.now.to_date}]
  has_many    :shopping_cart_items
  belongs_to  :special_occasion
  belongs_to  :creator,
              :class_name => "User",
              :foreign_key => "created_by"
  belongs_to  :updater,
              :class_name => "User",
              :foreign_key => "updated_by"

  validates_presence_of :name, :description, :product_category_id, :production_quota_value, :running_order, :created_by
  validates_uniqueness_of :name
  validates_numericality_of :product_category_id
  validates_numericality_of :options_list_id, :allow_nil => true
  validates_numericality_of :production_quota_value
  validates_numericality_of :running_order
  validates_numericality_of :special_occasion_id, :allow_nil => true
  
  def occasion
    if special_occasion_id.to_i > 0
      special_occasion.name
    else
      ""
    end
  end
  
  def options
    if options_list_id.to_i > 0
      options_list.name
    else
      ""
    end
  end
  
end
