class ProductCategory < ActiveRecord::Base
  attr_accessible :name, :description, :one_choice_only, :options_list_id, :running_order
  
  belongs_to :options_list
  
  validates_presence_of :name, :description, :running_order
  validates_uniqueness_of :name
  validates_numericality_of :running_order
  
end
