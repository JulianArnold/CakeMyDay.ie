class UserGroup < ActiveRecord::Base
  attr_accessible :description, :is_a_manager, :is_an_admin, :name
  
  has_many :users
  
  validates_presence_of :description, :name
  validates_uniqueness_of :name
  
end
