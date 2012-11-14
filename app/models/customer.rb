class Customer < ActiveRecord::Base
  attr_accessible :user_id, :postal_address, :contact_phone_number
  
  validates_presence_of :user_id
  validates_uniqueness_of :postal_address
  
  has_many :shopping_carts
  belongs_to :user
  
end
