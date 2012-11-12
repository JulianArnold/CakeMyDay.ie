class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :main_heading
      t.text :main_body
      t.string :menu_label
      t.boolean :show_in_main_menu
      t.integer :main_menu_running_order
      t.boolean :show_in_page_footer
      t.integer :footer_running_order
      t.string :window_title
      t.string :page_description
      t.string :search_terms

      t.timestamps
    end
  end
end
