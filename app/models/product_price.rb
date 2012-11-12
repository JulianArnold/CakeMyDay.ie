class ProductPrice < ActiveRecord::Base
  attr_accessible :start_at, :finish_at, :product_id, :currency_id, :price, :created_by, :updated_by
  
  belongs_to :currency
  belongs_to :product
  has_many   :shopping_cart_items
  belongs_to  :creator,
              :class_name => "User",
              :foreign_key => "created_by"
  belongs_to  :updater,
              :class_name => "User",
              :foreign_key => "updated_by"
  
end
