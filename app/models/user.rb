class User < ActiveRecord::Base
  attr_accessible :current_login_at, :current_login_ip, :failed_login_count, :first_name, :last_login_at, :last_login_ip, :last_name, :last_request_at, :login, :login_count
  #attr_accessible :password, :user_group_id, :active, :password_confirmation
 
  acts_as_authentic do |c|
    if Rails.env.production?
      c.logged_in_timeout = 30.minutes
    else
      c.logged_in_timeout = 90.minutes
    end
  end # block optional
  
  belongs_to :user_group
  has_one   :customer

  validates_presence_of     :login, :first_name, :last_name, :user_group_id
  validates_numericality_of :user_group_id, :only_integer => true
  validates_uniqueness_of   :login
  validates_format_of       :login, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i, :message => "must be a valid email address."
  validates_length_of       :login, :within => 7..40 # a@bc.de
  validates_length_of       :password, :minimum => 5, :message => "is too short!", :on => :update, :allow_nil => true, :allow_blank => true
  validates_length_of       :first_name, :within => 2..30
  validates_length_of       :last_name, :within => 2..40
  
  def admin?
    if user_group.is_an_admin == true
      return true
    else
      return false
    end
  end
  
  def manager?
    if user_group.is_a_manager == true
      return true
    else
      return false
    end
  end
  
  def full_name
    return first_name.titleize + " " + last_name.gsub("O\'","O\' ").titleize.gsub("O\' ","O\'")
  end
  
end