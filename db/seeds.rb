# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  
  
  UserGroup.destroy_all
  UserGroup.create(name: "Customers", description: "Used for normal customers.", is_a_manager: false, is_an_admin: false)
  UserGroup.create(name: "Managers", description: "Managers can do almost anything.", is_a_manager: true, is_an_admin: false)
  UserGroup.create(name: "Sys Admins", description: "Can do anything.", is_a_manager: true, is_an_admin: true)


  User.destroy_all
  u = User.new
  u.first_name = "Dan"
  u.last_name = "Laffan"
  u.login = "dan.laffan@mac.com"
  u.password = "123123"
  u.password_confirmation = "123123"
  u.user_group_id = UserGroup.find_by_name("Sys Admins").id
  u.active = true
  u.save

  u = User.new
  u.first_name = "Julian"
  u.last_name = "Arnold"
  u.login = "julian.arnold@hotmail.com"
  u.password = "123123"
  u.password_confirmation = "123123"
  u.user_group_id = UserGroup.find_by_name("Sys Admins").id
  u.active = true
  u.save

  u = User.new
  u.first_name = "Bob"
  u.last_name = "Testcustomerssen"
  u.login = "bob@example.com"
  u.password = "123123"
  u.password_confirmation = "123123"
  u.user_group_id = UserGroup.find_by_name("Customers").id
  u.active = true
  u.save

  u = User.new
  u.first_name = "Geraldine"
  u.last_name = "Arnold"
  u.login = "ger.arnold@gmail.com"
  u.password = "123123"
  u.password_confirmation = "123123"
  u.user_group_id = UserGroup.find_by_name("Managers").id
  u.active = true
  u.save

  Currency.destroy_all
  c = Currency.new
  c.iso_code = "EUR"
  c.full_name = "Euro"
  c.active = true
  c.currency_symbol = "&euro;"
  c.running_order = 100
  c.save

  GeneralSetting.destroy_all
  g = GeneralSetting.new
  g.aws_bucket_name = "cakemyday_ie"
  g.customer_service_email_address = "info@cakemyday.ie"
  g.customer_service_phone_number = "+353(86)837 2795"
  g.default_value_for_weekly_production_quota = 5
  g.rbn_number = "406682"
  g.default_currency_id = Currency.find_by_iso_code("EUR").id
  g.save


  SpecialOccasion.destroy_all
  SpecialOccasion.create({name: "Weddings", running_order: 400, visible_to_customers: true})
  SpecialOccasion.create({name: "Birthdays", running_order: 200, visible_to_customers: true})
  SpecialOccasion.create({name: "Christenings", running_order: 100, visible_to_customers: true})
  SpecialOccasion.create({name: "Retirements", running_order: 600, visible_to_customers: true})
  SpecialOccasion.create({name: "Product Launches", running_order: 500, visible_to_customers: true})
  SpecialOccasion.create({name: "First Communion", running_order: 300, visible_to_customers: true})


  OptionsList.destroy_all
  OptionsList.create(:name => 'sponge base flavours', :options => 'Vanilla, Lemon, Chocolate, Coffee, White chocolate and lime, Red velvet', :visible_label => 'Choose a flavour')
  OptionsList.create(:name => 'filling choices', :options => 'Vanilla buttercream, Orange buttercream, Lemon buttercream, Chocolate buttercream, Chocolate ganache, Italian meringue buttercream', :visible_label => 'Choose a flavour')
  OptionsList.create(:name => 'flower types', :options => 'Rose, Carnation, Daisy, Gerbera', :visible_label => 'Choose a type of flower')
  OptionsList.create(:name => 'shaped cake cores', :options => 'Chocolate biscuit cake, Sponge - vanilla, Sponge - lemon, Sponge - chocolate, Sponge - coffee, Sponge - white chocolate and lime, Sponge - red velvet', :visible_label => 'Choose the cake type')
  

  ProductCategory.destroy_all
  ProductCategory.create({name: "The Cake Shape", description: "Choose the basic size and shape of your cake", one_choice_only: true, running_order: 100})
  ProductCategory.create({name: "The Cake Filling", one_choice_only: true, 
          description: "Choose your favourite filling from one of the choices below", running_order: 200, 
          options_list_id: nil})
  ProductCategory.create({name: "The Covering", one_choice_only: true, 
          description: "Choose the colour of the covering for your cake.", running_order: 300, 
          options_list_id: OptionsList.find(:first, :conditions => [""])})
  ProductCategory.create({name: "Side Decorations", 
          description: "Choose how you would like the side of your cake to be decorated from the following:", 
          one_choice_only: true, running_order: 400})
  ProductCategory.create({name: "Over The Top", one_choice_only: false, 
          description: "Time to go wild! Choose how you want the top of your cake to look.  Add people, animals, firniture, cars, musical instruments, whatever you can think of!", running_order: 500})


  Product.destroy_all
  Product.create(:name => 'Square 4" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Guitar 18"x10" (large)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Guitar 12"x6" (small)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Bass Guitar 18"x10" (large)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Bass Guitar 12"x6" (small)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Drum 12" (large)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Drum 12" (small)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '1960s VW Beetle 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'BMW Mini Cooper 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Lamborghini car 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Aston Martin DB5 (Bond car) 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Truck or bus 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :pre_configured_product => true, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 1', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7600, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 2', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7700, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 3', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7800, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 4', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7900, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 5', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 8000, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 6', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 8100, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 7', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8200, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 8', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8300, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 9', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8400, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 10', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8500, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Wedding cake 11', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8600, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Filling', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("filling choices").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Cake Filling").id, :production_quota_value => 0, :running_order => 8700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Covering - please choose a colour', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("The Covering").id, :production_quota_value => 0, :running_order => 8800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Edible ribbon & bow - please choose a colour', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 8900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '2D flowers - please choose a colour', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D flowers - 2" (each) - please choose a type', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("flower types").id, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '2D computer-printed edible image (cake sides)', :description => 'A computer-printed edible image for the entire circumference of the cake.  You can supply the image.', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D edible character / figure - 4" tall', :description => 'Please use the text box to describe the character you require.', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3d inedible character / figure - 4" tall', :description => 'Please use the text box to describe your requirements.', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D person 4" tall - simple version', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D person 4" tall - detailed version', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D vehicle 4" long', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D vehicle 8" long', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D animal 4" tall', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D animal 6" tall', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 10000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Bride & Groom topper', :description => 'Highly representative depiction of the happy couple on their special day.  Typical height 6\".', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 1, :running_order => 10100, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => '3D object - to your requirements', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 10200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '2D computer-printed image (cake top surface)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :pre_configured_product => false, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 10300, :special_occasion_id => nil, :created_by => User.first.id)


  ShoppingCartStatus.destroy_all
  ShoppingCartStatus.create({name: "Live cart", description: "Shopping cart that has not bee checked out as yet.", active_cart: true, paid_cart: false, chargeback_cart: false, production_started: false, production_complete: false, running_order: 100})
  ShoppingCartStatus.create({name: "Paid", description: "Shopping cart that has been paid.", active_cart: false, paid_cart: true, chargeback_cart: false, production_started: false, production_complete: false, running_order: 200})
  ShoppingCartStatus.create({name: "Charged back!", description: "Payment has been bounced by PayPal.", active_cart: false, paid_cart: false, chargeback_cart: true, production_started: false, production_complete: false, running_order: 300})
  ShoppingCartStatus.create({name: "Production started", description: "Work on producing the shopping cart has started.", active_cart: false, paid_cart: true, chargeback_cart: false, production_started: true, production_complete: false, running_order: 400})
  ShoppingCartStatus.create({name: "Production complete", description: "Production is complete. The cake is ready.", active_cart: false, paid_cart: true, chargeback_cart: false, production_started: false, production_complete: true, running_order: 500})


  StaticPage.destroy_all
  StaticPage.create({main_heading: "About CakeMyDay", main_body: "CakeMyDay was founded in 2009 by Geraldine Arnold in Celbridge, Co. Kildare.\r\n\r\nGeraldine is passionate about the creativity she infuses in her cake creations.  Each cake is individually crafted to the precise requirements of each customer.", menu_label: "About Us", show_in_main_menu: true, main_menu_running_order: 100, show_in_page_footer: true, footer_running_order: 100, window_title: "Hand made cakes in Dublin, Kildare, Louth, Wicklow and Meath", page_description: "Geraldine is passionate about the creativity she infuses in her cake creations.  Each cake is individually crafted to the precise requirements of each customer.", search_terms: "hand made cakes, handmade cakes, designer cakes, wedding cakes"})
  StaticPage.create({main_heading: "Contact Us", main_body: "215 Glendale Meadows,\r\nLeixlip,\r\nCo. Kildare\r\n\r\n  +353-86-837 2795\r\n\r\ninfo@cakemyday.ie", menu_label: "Contact Us", show_in_main_menu: true, main_menu_running_order: 200, show_in_page_footer: true, footer_running_order: 50, window_title: "Get in touch", page_description: "Get in touch with us at CakeMyDay.ie", search_terms: "yummy cakes, super cakes, stuff"})


  FinishedProduct.destroy_all
  # create new Finished Products below this line
  FinishedProduct.create({product_name: "Aston Martin DB5 Car Birthday Cake",
    description: "The general theme of birthday cakes that I make for my husband will probably always be James Bond, as he's a mega-fan! This year, I decided to challenge myself and make an Aston Martin DB5.  For the backdrop, I followed a tutorial from 'Emily Made A Wish' - I airbrushed the back board black and attached an edible print of a Goldfinger poster.  I carved the car from chocolate sponge and covered it in chocolate ganache.  I then covered it in sugarpaste and marked out the details like doors, windows, etc. by closely studying a little model of the car that we conveniently have in the house!  I sprayed the car with edible silver lustre spray to give it a more realistic look.\r\rHubby was thrilled with it, so objective achieved!!",
    typical_price: 150.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 100,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-11-08 0:00:00"
    })

  FinishedProduct.create({product_name: "Shoe and a Box Birthday Cake",
    description: "I made this cake for my friend Louise for her 30th birthday.  She's very glamorous and loves shopping, shoes, handbags and all things girlie!  I handmade a purple stiletto shoe from flower paste and made a flower with some edible bling as decoration for the front of it.  The shoebox behind is a 12\" chocolate sponge which was halved and stacked into the shape of a shoebox, filled with chocolate buttercream and covered with chocolate ganache and sugarpaste.\r\rLouise loved the cake, and as I was at the party I got to see her reaction to it first-hand... even though I couldn't watch as it was being cut!!",
    typical_price: 150.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 200,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-11-24 0:00:00"
    })
    
	FinishedProduct.create({product_name: "Clutch Handbag Birthday Cake",
    description: "I LOVE how this cake turned out... it is a replica of a Lucy Nagle clutch handbag, made from chocolate biscuit cake.  The actual handbag is tiny, so this is a scaled-up version, measuring approximately 12 inches long and 7 inches high.  I covered the cake with a thin coat of pink sugarpaste to start with and then cut out hundreds of hot pink tiny squares and placed them on the cake.  I then airbrushed it to give it a stronger pink colour, and lustred every second square to give a woven ribbon effect.  I also made the knot clasp from flower paste and painted it with edible paint to look like the real thing.\r\rThe best bit about this cake is that it was a birthday cake for the handbag designer herself!  No pressure there then!",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 300,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-11-08 0:00:00"
    })

FinishedProduct.create({product_name: "Dr. Who Tardis Birthday Cake",
    description: "My friend Grainne asked me to make this cake for her niece, Ella.  It was Ella's 13th birthday and she is a HUGE Dr. Who fan... she even went to a Dr. Who convention in London recently!  Knowing she'd notice all the little details, I spent a long time researching pictures and working out dimensions for the Tardis.\r\rI made a 12\" square chocolate biscuit cake, and cut it in half and stood it on end, sandwiched together with chocolate ganache.  Then I covered the cake with navy sugarpaste, and started filling in all the details.  The Police Box sign and notice on the door are edible images.  I made a cobblestone design on the cake board to make it look more realistic.\r\rElla was totally delighted with the cake, and was able to tell me that it was a version of the Tardis from Series 5!!!  Phew, I must have done a good job in that case!",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 400,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-09-24 0:00:00"
    })
    
FinishedProduct.create({product_name: "New MINI Car Birthday Cake",
    description: "There's a sweet story attached to this cake... Ella had ordered a cake from me a few months ago for her boyfriend's 21st birthday.  She was living in Limerick but he was working up in Dublin and the party was in Dublin so she collected the cake from me on the way there.  Last week it was Ella's 21st birthday so David figured out where she had got his cake from, and ordered a cake for her from me again... this cake had to make the reverse trip down to Limerick this time!\r\rElla has just got a new Mini One car, so that was what he wanted her cake to look like.  I got photos of her exact car, so that I could copy the colours exactly.  I carved the car out of vanilla sponge and filled it with vanilla buttercream.  I then covered it in white chocolate ganache and a thin layer of white sugarpaste before putting on the final coat of navy sugarpaste.  I also gave it a light airbrush of violet colour as her car is a purple-y shade of blue.  Then I added all the little details... wipers, lights, badges, wing mirrors.  Ta da!",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 500,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-08-21 0:00:00"
    })
    
FinishedProduct.create({product_name: "Lamborghini Car Birthday Cake",
    description: "Paula from Celbridge ordered this cake for her husband John's 50th birthday.  He loves cars and is a big fan of the BBC car show \"Top Gear\", so she thought a Lamborghini car cake would be ideal.  I made a little model of The Stig from Top Gear standing beside the car in his trademark pose.\r\rThe cake was a vanilla sponge with vanilla buttercream, carved into the car shape, covered in white chocolate ganache, and then in sugarpaste.  I had blueprints and photos of Lamborghinis beside me while I added all the details, just to be sure I got it right!",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 600,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-08-20 0:00:00"
    })
    
FinishedProduct.create({product_name: "Navy and White Birdcage Wedding Cake",
    description: "I made this birdcage wedding cake for Siobhan and Darren last weekend.  They live in England but got married in Leixlip.  They loved the pale blue wedding cake that I had made for the Dublin Sugarcraft show but wanted it in a darker shade of blue, so it would look like the night sky.  I think the navy icing actually looks pretty dramatic with the white details over it.\r\rThe bottom tier is a 10\" chocolate biscuit cake, covered in navy sugarpaste and white sugarveil icing.  The top tier is three 7\" white chocolate and lime cakes stacked and carved into the birdcage shape.  I piped the bars and scroll designs with royal icing, and handmade the hydrangea blossoms and roses from flower paste!",
    typical_price: 300.00,
    special_occasion_id: SpecialOccasion.find_by_name("Weddings").id,
    running_order: 700,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-08-12 0:00:00"
    })    
    

  Image.destroy_all
  # add new images below
  Image.create({file_name: "320x240_aston_martin_db5_car_birthday_cake.jpg", 
        uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
        
  Image.create({file_name: "1357x1016_shoe_and_a_box_birthday_cake.jpg",
        uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
        
  Image.create({file_name: "clutch_handbag_1278x959.jpg",
        uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
        
  Image.create({file_name: "tardis_901x1204.jpg", 
        uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
        
  Image.create({file_name: "mini_car_960x1536.jpg", 
		uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
		
  Image.create({file_name: "lamborghini_1280x800.jpg", 
    	uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
    	
  Image.create({file_name: "navy_birdcage_763x1022.jpg", 
    	uploaded_by: User.find_by_login("julian.arnold@hotmail.com").id})
   


  FinishedProductImage.destroy_all
  # add new FinishedProductImages below
  FinishedProductImage.create({
        finished_product_id: FinishedProduct.find_by_product_name("Aston Martin DB5 Car Birthday Cake").id,
        image_id: Image.find_by_file_name("320x240_aston_martin_db5_car_birthday_cake.jpg").id,
        running_order: 100})
        
  FinishedProductImage.create({
        finished_product_id: FinishedProduct.find_by_product_name("Shoe and a Box Birthday Cake").id,
        image_id: Image.find_by_file_name("1357x1016_shoe_and_a_box_birthday_cake.jpg").id,
        running_order: 200})
        
  FinishedProductImage.create({
        finished_product_id: FinishedProduct.find_by_product_name("Clutch Handbag Birthday Cake").id,
        image_id: Image.find_by_file_name("clutch_handbag_1278x959.jpg").id,
        running_order: 300})

  FinishedProductImage.create({
        finished_product_id: FinishedProduct.find_by_product_name("Dr. Who Tardis Birthday Cake").id,
        image_id: Image.find_by_file_name("tardis_901x1204.jpg").id,
        running_order: 400})
        
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("New MINI Car Birthday Cake").id,
    	image_id: Image.find_by_file_name("mini_car_960x1536.jpg").id,
    	running_order: 500})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Lamborghini Car Birthday Cake").id,
    	image_id: Image.find_by_file_name("lamborghini_1280x800.jpg").id,
    	running_order: 600}) 
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Navy and White Birdcage Wedding Cake").id,
    	image_id: Image.find_by_file_name("navy_birdcage_763x1022.jpg").id,
    	running_order: 700})    	       
        
  
  Customer.destroy_all
  Customer.create({user_id: User.find_by_login("bob@example.com").id, 
        postal_address: "123 Main Street,\r\nBallymun,\r\n Dublin 11",
        contact_phone_number: "087 1234567"
        })

  
  ProductPrice.destroy_all
  ProductPrice.create({
        start_at: "2012-11-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.first.id,
        currency_id: GeneralSetting.first.default_currency_id,
        price: 69.99,
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })

  PayPalStatus.destroy_all
  PayPalStatus.create({name: "Paid", description: "The transaction has been confirmed as paid.", pending_authorisation: false, paid_sale: true, charged_back: false})
  PayPalStatus.create({name: "Chargeback", description: "The transaction has been charged back.  This usually means fraud.", pending_authorisation: false, paid_sale: false, charged_back: true})
  PayPalStatus.create({name: "Pending", description: "The transaction has been marked as pending by PayPal.", pending_authorisation: true, paid_sale: false, charged_back: false})


  ShoppingCart.destroy_all
  ShoppingCart.create({
        cake_required_at: "2013-04-23 15:00:00",
        customer_id: Customer.first.id,
        general_description_from_customer: "A birthday cake for Dan",
        name_to_appear_on_cake: "Dan",
        pay_pal_status_id: PayPalStatus.find_by_name("Paid").id,
        session_id: "abcdefg",
        shopping_cart_status_id: ShoppingCartStatus.find_by_name("Paid").id,
        special_occasion: "Birthday", 
        production_quotum_id: ProductionQuotum.first(conditions: ["start_date <= ? and finish_date >= ?", "2013-04-23".to_date, "2013-04-23".to_date]).id
        })
  
  ShoppingCartItem.destroy_all
  s = ShoppingCartItem.new({
        shopping_cart_id: ShoppingCart.first.id,
        product_id: Product.first.id,
        product_options_list_choice: "",
        product_price_id: ProductPrice.first.id,
        quantity: 1, global_options_list_choice: "Purple",
        user_description: ""
        })
      s.save
  
  
  # That's it so far!
  
end