class SpecialOccasion < ActiveRecord::Base
  attr_accessible :name, :running_order, :visible_to_customers
  
  validates_presence_of :name, :running_order
  validates_uniqueness_of :name
  validates_numericality_of :running_order
  
  has_many :products
  
end
