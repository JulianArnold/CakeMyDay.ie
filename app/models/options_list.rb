class OptionsList < ActiveRecord::Base
  attr_accessible :name, :options, :visible_label
  
  has_many :product_categories
  has_many :products

  validates_presence_of :name, :options, :visible_label
  validates_uniqueness_of :name
  validates_uniqueness_of :visible_name

end
