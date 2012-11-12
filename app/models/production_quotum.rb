class ProductionQuotum < ActiveRecord::Base
  attr_accessible :start_date, :finish_date, :maximum_cakes_allowed
  
  validates_presence_of :start_date, :finish_date, :maximum_cakes_allowed
  validates_numericality_of :maximum_cakes_allowed
  validates_uniqueness_of :start_date
  
end
