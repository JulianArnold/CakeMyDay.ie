class WeeklyQuotum < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :quota
  
  has_many    :shopping_carts
  belongs_to  :creator,
              :class_name => "User",
              :foreign_key => "created_by"
  belongs_to  :updater,
              :class_name => "User",
              :foreign_key => "updated_by"
  
  validates_presence_of :start_date, :end_date, :quota, :created_by
  validates_uniqueness_of :start_date
  validates_numericality_of :quota
  validates_numericality_of :created_by
  validates_numericality_of :updated_by, :allow_nil => true
  
end
