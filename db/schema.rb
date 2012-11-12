# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121112111210) do

  create_table "currencies", :force => true do |t|
    t.string   "iso_code"
    t.string   "currency_symbol"
    t.string   "full_name"
    t.integer  "running_order"
    t.boolean  "active"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "customers", :force => true do |t|
    t.integer  "user_id"
    t.text     "postal_address"
    t.string   "contact_phone_number"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "general_settings", :force => true do |t|
    t.integer  "default_value_for_weekly_production_quota"
    t.string   "customer_service_email_address"
    t.string   "customer_service_phone_number"
    t.string   "aws_bucket_name"
    t.string   "rbn_number"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "file_name"
    t.string   "bucket_name"
    t.string   "content_type"
    t.integer  "file_size"
    t.boolean  "finished_product"
    t.boolean  "base_product"
    t.integer  "uploaded_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "options_lists", :force => true do |t|
    t.string   "name"
    t.string   "visible_label"
    t.text     "options"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pay_pal_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "pending_authorisation"
    t.boolean  "paid_sale"
    t.boolean  "charged_back"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "pay_pal_transactions", :force => true do |t|
    t.string   "paypal_transaction_id"
    t.integer  "shopping_cart_id"
    t.integer  "result_code"
    t.string   "currency_code"
    t.integer  "currency_id"
    t.decimal  "amount"
    t.text     "rest_of_the_stuff_serialised"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "one_choice_only"
    t.integer  "running_order"
    t.integer  "options_list_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "product_components", :force => true do |t|
    t.integer  "product_id"
    t.integer  "component_product_id"
    t.integer  "quantity"
    t.integer  "running_order"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "product_images", :force => true do |t|
    t.integer  "product_id"
    t.integer  "image_id"
    t.integer  "running_order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "product_prices", :force => true do |t|
    t.integer  "product_id"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer  "currency_id"
    t.decimal  "price"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "production_quota", :force => true do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "maximum_cakes_allowed"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "production_quota_value"
    t.integer  "product_category_id"
    t.integer  "options_list_id"
    t.boolean  "pre_configured_product"
    t.integer  "special_occasion_id"
    t.boolean  "allow_user_to_choose_quantity"
    t.boolean  "allow_user_to_enter_description"
    t.integer  "running_order"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "shopping_cart_items", :force => true do |t|
    t.integer  "shopping_cart_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "product_price_id"
    t.string   "product_options_list_choice"
    t.string   "global_options_list_choice"
    t.string   "user_description"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "shopping_cart_statuses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active_cart"
    t.boolean  "paid_cart"
    t.boolean  "chargeback_cart"
    t.boolean  "production_started"
    t.boolean  "production_complete"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "shopping_carts", :force => true do |t|
    t.integer  "customer_id"
    t.string   "session_id"
    t.datetime "cake_required_at"
    t.integer  "weekly_quota_id"
    t.string   "special_occasion"
    t.string   "name_to_appear_on_cake"
    t.integer  "shopping_cart_status_id"
    t.integer  "pay_pal_status_id"
    t.text     "general_description_from_customer"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "special_occasions", :force => true do |t|
    t.string   "name"
    t.integer  "running_order"
    t.boolean  "visible_to_customers"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "static_pages", :force => true do |t|
    t.string   "main_heading"
    t.text     "main_body"
    t.string   "menu_label"
    t.boolean  "show_in_main_menu"
    t.integer  "main_menu_running_order"
    t.boolean  "show_in_page_footer"
    t.integer  "footer_running_order"
    t.string   "window_title"
    t.string   "page_description"
    t.string   "search_terms"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_a_manager"
    t.boolean  "is_an_admin"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "weekly_quota", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "quota"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
