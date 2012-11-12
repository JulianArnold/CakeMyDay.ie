class PayPalTransaction < ActiveRecord::Base
  attr_accessible :amount, :currency_code, :currency_id, :paypal_transaction_id, :rest_of_the_stuff_serialised, :result_code, :shopping_cart_id
  
  belongs_to :currency
  belongs_to :shopping_cart
  
  validates_presence_of :amount, :currency_code, :currency_id, :paypal_transaction_id, :rest_of_the_stuff_serialised, :result_code, :shopping_cart_id
  validates_numericality_of :amount, :currency_id, :paypal_transaction_id
  validates_numericality_of :shopping_cart_id, :allow_nil => true
  
end
