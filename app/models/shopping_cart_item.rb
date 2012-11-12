class ShoppingCartItem < ActiveRecord::Base
  attr_accessible :shopping_cart_id, :product_id, :product_options_list_choice, :product_price_id, :quantity, :global_options_list_choice, :user_description
  
  belongs_to  :product
  belongs_to  :product_price
  belongs_to  :shopping_cart
  
  validates_presence_of :shopping_cart_id, :product_id, :product_price_id, :quantity
  validates_numericality_of :quantity, :allow_nil => true
  validates_numericality_of :shopping_cart_id, :product_id, :product_price_id

end
