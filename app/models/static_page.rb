class StaticPage < ActiveRecord::Base
  attr_accessible :footer_running_order, :main_body, :main_heading, :main_menu_running_order, :menu_label, :page_description, :search_terms, :show_in_main_menu, :show_in_page_footer, :window_title
  
  validates_presence_of :main_body, :main_heading, :menu_label, :page_description, :search_terms, :window_title
  validates_numericality_of :footer_running_order, :allow_nil => true
  validates_numericality_of :main_menu_running_order, :allow_nil => true
  
end
