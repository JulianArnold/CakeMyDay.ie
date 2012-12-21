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
  u.login = "julian_arnold@hotmail.com"
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
  
  c = Currency.new
  c.iso_code = "GBP"
  c.full_name = "Pounds Sterling"
  c.active = false
  c.currency_symbol = "&#163;"
  c.running_order = 200
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
  OptionsList.create(:name => "outer colours", :options => "White, Light pink, Dark pink, Light blue, Dark blue, Red, Light Gren, Dark green, Light gray, Dark gray, Black", :visible_label => "Choose a colour")
  

  ProductCategory.destroy_all
  ProductCategory.create({name: "The Cake Shape", description: "Choose the basic size and shape of your cake", one_choice_only: true, running_order: 100})
  ProductCategory.create({name: "The Cake Filling", one_choice_only: true, 
          description: "Choose your favourite filling from one of the choices below", running_order: 200, 
          options_list_id: nil})
  ProductCategory.create({name: "The Covering", one_choice_only: true, 
          description: "Choose the colour of the covering for your cake.", running_order: 300, 
          options_list_id: OptionsList.find_by_name("outer colours").id})
  ProductCategory.create({name: "Side Decorations", 
          description: "Choose how you would like the side of your cake to be decorated from the following:", 
          one_choice_only: true, running_order: 400})
  ProductCategory.create({name: "Over The Top", one_choice_only: false, 
          description: "Time to go wild! Choose how you want the top of your cake to look.  Add people, animals, firniture, cars, musical instruments, whatever you can think of!", running_order: 500})


  Product.destroy_all
  Product.create(:name => 'Square 4" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 1900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 4" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 2900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 4" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 3900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, fruit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, chocolate biscuit cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 4900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, sponge cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("sponge base flavours").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 5900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Square 6" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 8" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 9" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 10" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Circular 6" high, 12" diameter, carrot cake', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Guitar 18"x10" (large)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Guitar 12"x6" (small)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Bass Guitar 18"x10" (large)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Bass Guitar 12"x6" (small)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Drum 12" (large)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 6900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Drum 12" (small)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '1960s VW Beetle 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'BMW Mini Cooper 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Lamborghini car 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Aston Martin DB5 (Bond car) 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Truck or bus 10" length', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("shaped cake cores").id, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 1, :running_order => 7500, :special_occasion_id => nil, :created_by => User.first.id)
  # Wedding cakes have been commented out by Dan 16/12/12
#  Product.create(:name => 'Wedding cake 1', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7600, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 2', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7700, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 3', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7800, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 4', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 7900, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 5', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 8000, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 6', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 3, :running_order => 8100, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 7', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8200, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 8', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8300, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 9', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8400, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 10', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8500, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
#  Product.create(:name => 'Wedding cake 11', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Cake Shape").id, :production_quota_value => 4, :running_order => 8600, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => 'Filling', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => OptionsList.find_by_name("filling choices").id, :product_category_id => ProductCategory.find_by_name("The Cake Filling").id, :production_quota_value => 0, :running_order => 8700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Covering - please choose a colour', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("The Covering").id, :production_quota_value => 0, :running_order => 8800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Edible ribbon & bow - please choose a colour', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 8900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '2D flowers - please choose a colour', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D flowers - 2" (each) - please choose a type', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => OptionsList.find_by_name("flower types").id, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9100, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '2D computer-printed edible image (cake sides)', :description => 'A computer-printed edible image for the entire circumference of the cake.  You can supply the image.', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => false, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D edible character / figure - 4" tall', :description => 'Please use the text box to describe the character you require.', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9300, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3d inedible character / figure - 4" tall', :description => 'Please use the text box to describe your requirements.', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Side Decorations").id, :production_quota_value => 0, :running_order => 9400, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D person 4" tall - simple version', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9500, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D person 4" tall - detailed version', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9600, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D vehicle 4" long', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9700, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D vehicle 8" long', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9800, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D animal 4" tall', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 9900, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '3D animal 6" tall', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 10000, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => 'Bride & Groom topper', :description => 'Highly representative depiction of the happy couple on their special day.  Typical height 6\".', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 1, :running_order => 10100, :special_occasion_id => SpecialOccasion.find_by_name("Weddings").id, :created_by => User.first.id)
  Product.create(:name => '3D object - to your requirements', :description => 'pending', :allow_user_to_choose_quantity => true, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 10200, :special_occasion_id => nil, :created_by => User.first.id)
  Product.create(:name => '2D computer-printed image (cake top surface)', :description => 'pending', :allow_user_to_choose_quantity => false, :allow_user_to_enter_description => true, :options_list_id => nil, :product_category_id => ProductCategory.find_by_name("Over The Top").id, :production_quota_value => 0, :running_order => 10300, :special_occasion_id => nil, :created_by => User.first.id)


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

FinishedProduct.create({product_name: "Drum Birthday Cake",
    description: "My friend Dan asked me to make this cake.  It was his friend Stuart's 40th birthday so he thought a custom-made cake would be an ideal present!  Stuart is a musician and plays a few instruments, including drums, so he wanted a replica drum cake.  I kept a few photos of Phidrums drums beside me while I worked in order to get the details exactly right.\r\rThe cake itself is a 12\" chocolate fudge cake, filled with chocolate buttercream and covered in sugarpaste.  Stuart loved the cake, and it was a great hit at the party!",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 800,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-08-11 0:00:00"
    })    

FinishedProduct.create({product_name: "Peppa Pig Castle Birthday Cake",
    description: "I made this castle cake for my beautiful little niece Mia for her second birthday.  She loves watching Peppa Pig cartoons on tv, and loves anything to do with Peppa... so I really knew my audience with this one!\r\rI made a 9\" round chocolate fudge cake, filled with chocolate buttercream, and there is a small 4\" cake on top.  The towers are made from ice cream cones covered in sugarpaste.  I handmade little models of Peppa, George, Mummy Pig and Daddy Pig.\r\rMia adored the cake and spent ages lifting off the towers and putting them back on and moving the little models around before we were allowed to eat it... it turned out to be a very interactive cake!",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 900,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-08-05 0:00:00"
    })

FinishedProduct.create({product_name: "Senan\'s Zoo Animals Birthday Cake",
    description: "I've made a couple of versions of this cake before, and it\'s always fun to do!  I love the baby giraffe looking up at its mother who is peeking out over the leaves.  Orla ordered this cake for her son Senan\'s second birthday.  He loves animals, and adores white owls... so I handmade giraffes, a white owl, a monkey and a sleeping lion for the top of the cake.  I put elephants, crocodiles and rhinos around the sides of the cake.\r\rThe cake itself was a 10-inch lemon sponge with lemon buttercream filling, covered in sugarpaste.\r\rI got this lovely email from Orla the day after the party, along with some photos, which I have put up on my facebook page - \"Thank you so so much for you wonderful cake, it was a complete hit!  Senan was squealing with excitement! It really looked amazing & with much reluctancy we did cut it & it tasted fantastic too, so light & fluffy, even the icing was polished off which is usually left behind!\r\rThanks again & we\'ll definitely be back\"",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 1000,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-08-04 0:00:00"
    })

FinishedProduct.create({product_name: "90th Birthday Cake - Tea and a Crossword Puzzle",
    description: "Eimear ordered this cake for her Dad's 90th birthday.  They were having a family party for him and wanted something fun for his cake.  He loves crosswords and always has a cup of tea by his side.  So I handmade a little model of him from modelling paste, along with a crossword in the newspaper and a cup of tea in his hand.  I made his little glasses from wire, so they\'re obviously not edible!  I also made a silver \"90\" and a spray of stars bursting out of the cake behind him.  Apparently the model ended up looking just like him!\r\rThe cake itself was a 9\" vanilla sponge with vanilla buttercream.",
    typical_price: 190.00,
    special_occasion_id: SpecialOccasion.find_by_name("Birthdays").id,
    running_order: 1100,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-07-29 0:00:00"
    })

FinishedProduct.create({product_name: "Tatty Teddy Christening Cake",
    description: "Lianne from Maynooth ordered this cake for her daughter Aoife's Christening.  She left the design completely up to me, and just asked for a girlie design that wasn't only pink and white.  As I had recently learned how to make a little tatty teddy model from Carol McHugh at the Dublin Sugarcraft Guild,  I thought it would look really cute on top of this Christening cake.  The cake itself was an 8\" chocolate biscuit cake, which I covered in white sugarpaste and then put on pale pink and green sugarpaste stripes.  I also made some bunting spelling out Aoife's name on the board.",
    typical_price: 190.00,
    special_occasion_id: SpecialOccasion.find_by_name("Christenings").id,
    running_order: 1200,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-11-02 0:00:00"
    })
    
FinishedProduct.create({product_name: "Lucy\'s Christening Cake (Family Scene)",
    description: "Owen in Tallaght ordered this cake for his daughter Lucy's Christening.  I made little models of the mum, dad, baby and dog from modelling paste, so they are completely edible.  Mum is looking lovingly in at the baby in a moses basket.  Dad is busy shushing their beagle dog.   I also made little soothers / pacifiers from modelling paste and put Lucy's name on them.\r\rThe top tier is a 6\" chocolate sponge with chocolate buttercream, and the bottom tier is an 8\" vanilla sponge with vanilla buttercream.",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Christenings").id,
    running_order: 1300,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-07-31 0:00:00"
    })
    
    FinishedProduct.create({product_name: "Ray Foley - \"Take Me Out\" 30th Birthday Cake",
    description: "This cake was ordered for the radio DJ and TV presenter Ray Foley by Sideline Productions.  They are producing a new TV show called Take Me Out, which Ray will be presenting.  As it was Ray's 30th birthday, they asked me to make him with a cake with the Take Me Out logo, the Sideline logo, and a little figurine of Ray dressed up as Cupid.  This is my first \"famous\" cake as it was featured on the Today FM website here: http://www.todayfm.com/Shows/Weekdays/Ray-Foley/Birthday.aspx and in various Irish newspapers on the day!\r\rThe cake itself is an 8\" chocolate biscuit cake, covered with chocolate ganache and sugarpaste.",
    typical_price: 150.00,
    special_occasion_id: SpecialOccasion.find_by_name("Product Launches").id,
    running_order: 1400,
    available_for_purchase: true,
    visible: true,
    created_at: "2010-09-21 0:00:00"
    })
    
    FinishedProduct.create({product_name: "LimeTree Cafe Launch Cake",
    description: "Friends of ours, Frank and Gerardette, had just opened a new cafe in Kilmainham.  Check it out at http://www.limetreecafe.net.  I made this cake for their launch party.  I piped the cafe logo on to the cake, and it was a huge hit at the party.\r\rThe cake itself is an 8\" lime-flavoured sponge filled with lime buttercream, and covered with lime buttercream and sugarpaste.",
    typical_price: 120.00,
    special_occasion_id: SpecialOccasion.find_by_name("Product Launches").id,
    running_order: 1500,
    available_for_purchase: true,
    visible: true,
    created_at: "2011-02-12 0:00:00"
    })
    
    FinishedProduct.create({product_name: "Peter and Michelle\'s Wedding Cake",
    description: "I made this wedding cake for my cousin Peter and his bride, Michelle.  The wedding colours were purple and silver, and they wanted hearts and little flowers on the cake.  I cut out hearts from gumpaste and painted them with edible silver paint.  I also cut out some purple hearts, and put them on wires to make them \"burst\" out of the top of the cake.  The flower stems on the sides of the cakes were piped with royal icing and I did some brush embroidery on the leaves.  I then painted the stems and leaves with the edible silver paint too.  It's lovely to make a wedding cake and be a guest at the reception to see the reaction to it.  Everyone loved it, and it was gobbled up pretty fast!\r\r.The cake itself was a 12\" chocolate biscuit cake, 10\" white chocolate and lime sponge, and 8\" fruit cake.  I have a lovely silver cake stand with cutout hearts, and put some purple material behind it to bring out the detail of the hearts.",
    typical_price: 370.00,
    special_occasion_id: SpecialOccasion.find_by_name("Weddings").id,
    running_order: 1600,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-05-01 0:00:00"
    })
    
    FinishedProduct.create({product_name: "Carl and Elaine\'s Wedding Cake",
    description: "This wedding cake was for my friends Carl and Elaine.  They wanted to be able to keep the cake topper after the wedding, so I handmade it from modelling clay, which will last forever.  Elaine sent me pictures of her wedding dress, and described what her bouquet would look like and what style of suit Carl would be wearing so that I could get the models to look as close to the real thing as possible.\r\rThe cake itself was made up of 3 tiers. The bottom tier was chocolate biscuit cake, the middle one was red velvet with white chocolate ganache filling, and the top one was fruit cake.  It was great to be a guest at the wedding, and be able to see the reactions to the cake.\r\rBelow is a closeup pic of the little bride and groom.",
    typical_price: 470.00,
    special_occasion_id: SpecialOccasion.find_by_name("Weddings").id,
    running_order: 1700,
    available_for_purchase: true,
    visible: true,
    created_at: "2011-02-12 0:00:00"
    })

    FinishedProduct.create({product_name: "Damien and Sinead\'s Wedding Cake",
    description: "I made this cake for Sinead and Damien's wedding in Galway.  They wanted a fairly simple design on their cake just dark blue ribbon to match the bridesmaid's dress, and flowers to match Sinead's bouquet.  Sinead showed me pictures of the bouquet she had chosen, so I handmade ivory and white roses and tiny blue flowers for the top of the cake.\r\rAs we were guests at the wedding, I actually got to taste some of the cake... and it was lovely, if I say so myself!\r\rThe cake was made up of 3 tiers 8\", 10\" and 12\". The bottom two tiers were vanilla sponge with vanilla buttercream, and the top tier was chocolate sponge with chocolate buttercream.  The whole cake was covered in white sugarpaste.  Included is a picture showing the flower detail on top of the cake.",
    typical_price: 300.00,
    special_occasion_id: SpecialOccasion.find_by_name("Weddings").id,
    running_order: 1800,
    available_for_purchase: true,
    visible: true,
    created_at: "2011-02-12 0:00:00"
    })

    FinishedProduct.create({product_name: "Miriam\'s First Communion Cake",
    description: "Mark ordered this cake to celebrate his daughter Miriam\'s First Holy Communion day.  He sent me pictures of Miriam and her Communion dress so that I could make a little figurine to look like her.  I made her using modelling paste, and a tiny bit of sugarveil icing for her veil.  I even managed to get her hair to look similar to her beautiful red hair.  The cake itself was a 9\" vanilla sponge with vanilla buttercream filling.  I covered it with white sugarpaste and added a gold chalice and inscription.\r\rMiriam was thrilled.",
    typical_price: 180.00,
    special_occasion_id: SpecialOccasion.find_by_name("First Communion").id,
    running_order: 1900,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-05-01 0:00:00"
    })

    FinishedProduct.create({product_name: "Retirement Cake for my Mother",
    description: "I made this cake for my mother\'s retirement from the Civil Service.  The cake was a big surprise as I was away in Birmingham at a cake show on the day she actually retired, so there was a lot of subterfuge involving my husband delivering the cake in secret to one of her work buddies.\r\rI made a 9\" chocolate sponge, filled with chocolate buttercream and covered with chocolate ganache and white sugarpaste.  Since my two brothers have two small children each, who all adore their granny, I made a little scene of them all for the top of the cake.  I put the models on a cake drum so that it could be lifted off the cake before cutting, and kept afterwards.  I handmade all the little figurines from modelling paste, as well as an armchair for my mother to sit in while the kids pile on top of her!  She\'ll be kept very very busy in her retirement!!.",
    typical_price: 200.00,
    special_occasion_id: SpecialOccasion.find_by_name("Retirements").id,
    running_order: 2000,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-11-18 0:00:00"
    })
    
    FinishedProduct.create({product_name: "Colm and Lisanne\'s Wedding Cake",
    description: "I made this 3 tier wedding cake for my friends, Colm and Lisanne.  Lisanne had very definite ideas of what she wanted the cake to look like, and I think it turned out very well! (If I say so myself!).  She sent me pictures of cakes she liked, and we took ideas from a few of them and merged them together.  The shape of the cake was unusual, a round bottom tier, square middle tier, and round top tier.  I handmade the figurines on the top of the cake from modelling clay, so that they could keep them after the wedding.  Lisanne's little dog Molly made it on to the cake too!\r\rI sprayed the whole cake with a pearl shimmery spray, and the top and bottom tiers were simply decorated with piped white dots.  The middle tier was more intricately decorated with dark purple icing piped on to it.  I sourced a beautiful lacy ribbon that matched the bridesmaids's dresses and wrapped it around it each tier to finish it off.\r\rThe cake itself was a 12\" round chocolate biscuit bottom tier, 8\" square lemon sponge with lemon buttercream, and 6\" round fruit cake.\r\rCloseup of the bride, groom and little doggy in the second photo.",
    typical_price: 500.00,
    special_occasion_id: SpecialOccasion.find_by_name("Weddings").id,
    running_order: 2100,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-11-18 0:00:00"
    })
    
    FinishedProduct.create({product_name: "Robert and Aine\'s Wedding Cake",
    description: "This 3 tier cake was for my cousin Robert and his fianc&#233;e Aine.  They had already bought a topper for the cake, and wanted a simple white iced cake.  I gave the icing a nice pearly finis, and finished off the cake set-up with a navy satin ribbon to match the bridesmaids' dresses.  I also iced a fruit cake that the bride\'s mother had made, to match the main wedding cake.\r\rThe cake itself is Red Velvet cake, filled with white chocolate ganache, covered in white chocolate ganache and sugarpaste.  Yummy!  The tiers are 6\", 8\" and 10\".",
    typical_price: 240.00,
    special_occasion_id: SpecialOccasion.find_by_name("Weddings").id,
    running_order: 2200,
    available_for_purchase: true,
    visible: true,
    created_at: "2010-12-29 0:00:00"
    })

    FinishedProduct.create({product_name: "Georgia\'s Christening Cake",
    description: "Carmel ordered this Christening cake for baby Georgia.  The cake was a 10 inch vanilla sponge with vanilla buttercream, covered in white sugarpaste.  I handmade the pink Converse booties from modelling paste.  They can be removed from the cake and kept as keepsakes afterwards.  I also made some pretty bunting for around the cake, pinned up by little flowers, I think this cake is pretty cute!",
    typical_price: 120.00,
    special_occasion_id: SpecialOccasion.find_by_name("Christenings").id,
    running_order: 2300,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-05-06 0:00:00"
    })

    FinishedProduct.create({product_name: "Jake and Alex Christening Cake",
    description: "I love love love this cake!  Siobh&#225;n and Derek from Lucan ordered it for their twins\' Christening.  I carved a bowl shaped cake and a round cake into the shape of the bottom half of the boat and a smaller square cake into the cabin part for the top.  All the little pairs of animals are handmade from modelling paste and completely edible.  There are paper lollipop sticks helping to support their heads in some cases though.  As the babies are a boy and a girl, I used nice soft pastel colours in pink, blue and lemon for the boat.  The original design is by the amazing Debbie Brown.\r\rThe cake itself was a lemon sponge bottom tier, with a chocolate sponge top tier.  This cake would be lovely for many different occasions and can be personalised; Christenings, birthdays, baby showers, maybe even engagements...!",
    typical_price: 240.00,
    special_occasion_id: SpecialOccasion.find_by_name("Christenings").id,
    running_order: 2400,
    available_for_purchase: true,
    visible: true,
    created_at: "2012-05-06 0:00:00"
    })


  Image.destroy_all
  # add new images below
  Image.create({file_name: "320x240_aston_martin_db5_car_birthday_cake.jpg", 
        finished_product: true, base_product: false,
        uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "1357x1016_shoe_and_a_box_birthday_cake.jpg",
        finished_product: true, base_product: false,
        uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "clutch_handbag_1278x959.jpg",
        finished_product: true, base_product: false,
        uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "tardis_901x1204.jpg", 
        finished_product: true, base_product: false,
        uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "mini_car_960x1536.jpg", 
      finished_product: true, base_product: false,
		  uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "lamborghini_1280x800.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "navy_birdcage_763x1022.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "drum_cake_1066x799.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "peppa_pig_castle_922x690.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "zoo_animals_birthday_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "90th_birthday_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "tatty_teddy_1145x1524.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "lucy_2_tier_christening_cake_soothers_1280x800.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "ray_foley_take_me_out_birthday_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "limetree_cafe_launch_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "start.png", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("dan.laffan@mac.com").id})
    	
  Image.create({file_name: "peter_michelle_wedding_cake_1280x960.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})
    	
  Image.create({file_name: "carl_and_elaines_wedding_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})
    	
  Image.create({file_name: "damien_and_sineads_wedding_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})
    	
  Image.create({file_name: "damien_and_sineads_wedding_cake_2.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})    	

  Image.create({file_name: "miriams_first_communion_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "mairead_retirement_1142x1520.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "colm_and_lisannes_wedding_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "colm_and_lisannes_wedding_cake_2.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "robert_and_aines_wedding_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})

  Image.create({file_name: "georgias_christening_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})
    	
  Image.create({file_name: "jake_and_alex_christening_cake.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})
    	
  Image.create({file_name: "jake_and_alex_christening_cake_2.jpg", 
      finished_product: true, base_product: false,
    	uploaded_by: User.find_by_login("julian_arnold@hotmail.com").id})


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
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Drum Birthday Cake").id,
    	image_id: Image.find_by_file_name("drum_cake_1066x799.jpg").id,
    	running_order: 800})      	 	       

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Peppa Pig Castle Birthday Cake").id,
    	image_id: Image.find_by_file_name("peppa_pig_castle_922x690.jpg").id,
    	running_order: 900})      	 	       
        
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Senan\'s Zoo Animals Birthday Cake").id,
    	image_id: Image.find_by_file_name("zoo_animals_birthday_cake.jpg").id,
    	running_order: 1000})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("90th Birthday Cake - Tea and a Crossword Puzzle").id,
    	image_id: Image.find_by_file_name("90th_birthday_cake.jpg").id,
    	running_order: 1100})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Tatty Teddy Christening Cake").id,
    	image_id: Image.find_by_file_name("tatty_teddy_1145x1524.jpg").id,
    	running_order: 1200})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Lucy\'s Christening Cake (Family Scene)").id,
    	image_id: Image.find_by_file_name("lucy_2_tier_christening_cake_soothers_1280x800.jpg").id,
    	running_order: 1300})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Ray Foley - \"Take Me Out\" 30th Birthday Cake").id,
    	image_id: Image.find_by_file_name("ray_foley_take_me_out_birthday_cake.jpg").id,
    	running_order: 1400})
 
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("LimeTree Cafe Launch Cake").id,
    	image_id: Image.find_by_file_name("limetree_cafe_launch_cake.jpg").id,
    	running_order: 1500})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Peter and Michelle\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("peter_michelle_wedding_cake_1280x960.jpg").id,
    	running_order: 1600})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Carl and Elaine\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("carl_and_elaines_wedding_cake.jpg").id,
    	running_order: 1700})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Damien and Sinead\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("damien_and_sineads_wedding_cake.jpg").id,
    	running_order: 1800})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Damien and Sinead\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("damien_and_sineads_wedding_cake_2.jpg").id,
    	running_order: 1800})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Miriam\'s First Communion Cake").id,
    	image_id: Image.find_by_file_name("miriams_first_communion_cake.jpg").id,
    	running_order: 1900})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Retirement Cake for my Mother").id,
    	image_id: Image.find_by_file_name("mairead_retirement_1142x1520.jpg").id,
    	running_order: 2000})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Colm and Lisanne\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("colm_and_lisannes_wedding_cake.jpg").id,
    	running_order: 2100})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Colm and Lisanne\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("colm_and_lisannes_wedding_cake_2.jpg").id,
    	running_order: 2100})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Robert and Aine\'s Wedding Cake").id,
    	image_id: Image.find_by_file_name("robert_and_aines_wedding_cake.jpg").id,
    	running_order: 2200})
    	
  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Georgia\'s Christening Cake").id,
    	image_id: Image.find_by_file_name("georgias_christening_cake.jpg").id,
    	running_order: 2300})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Jake and Alex Christening Cake").id,
    	image_id: Image.find_by_file_name("jake_and_alex_christening_cake.jpg").id,
    	running_order: 2400})

  FinishedProductImage.create({
    	finished_product_id: FinishedProduct.find_by_product_name("Jake and Alex Christening Cake").id,
    	image_id: Image.find_by_file_name("jake_and_alex_christening_cake_2.jpg").id,
    	running_order: 2400})
   	
  
  Customer.destroy_all
  Customer.create({user_id: User.find_by_login("bob@example.com").id, 
        postal_address: "123 Main Street,\r\nBallymun,\r\n Dublin 11",
        contact_phone_number: "087 1234567"
        })


  ProductPrice.destroy_all
  ############################
  ## THIS IS TEMPORARY CODE ##
  ############################
  Product.all.each do |product|
    ProductPrice.create({
          start_at: "2012-11-01".to_date,
          finish_at: "2099-12-31".to_date,
          product_id: product.id,
          currency_id: GeneralSetting.first.default_currency_id,
          price: 69.99,
          created_by: User.find_by_login("ger.arnold@gmail.com").id,
          updated_by: nil
          })
  end
  ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 8\" diameter, fruit cake").id,
        currency_id: GeneralSetting.first.default_currency_id,
        price: 120,
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Filling").id,
        currency_id: GeneralSetting.first.default_currency_id,
        price: 0,
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
  ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Covering - please choose a colour").id,
        price: 0,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 9\" diameter, fruit cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 10\" diameter, fruit cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 12\" diameter, fruit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 8\" diameter, fruit cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 9\" diameter, fruit cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 10\" diameter, fruit cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 12\" diameter, fruit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 8\" diameter, chocolate biscuit cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 9\" diameter, chocolate biscuit cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 10\" diameter, chocolate biscuit cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 12\" diameter, chocolate biscuit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 8\" diameter, chocolate biscuit cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 9\" diameter, chocolate biscuit cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 10\" diameter, chocolate biscuit cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 12\" diameter, chocolate biscuit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 8\" diameter, sponge cake").id,
        price: 80,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 9\" diameter, sponge cake").id,
        price: 90,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 10\" diameter, sponge cake").id,
        price: 100,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 12\" diameter, sponge cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 8\" diameter, sponge cake").id,
        price: 80,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 9\" diameter, sponge cake").id,
        price: 90,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 10\" diameter, sponge cake").id,
        price: 100,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 12\" diameter, sponge cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 8\" diameter, carrot cake").id,
        price: 80,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 9\" diameter, carrot cake").id,
        price: 90,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 10\" diameter, carrot cake").id,
        price: 100,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 4\" high, 12\" diameter, carrot cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 8\" diameter, carrot cake").id,
        price: 80,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 9\" diameter, carrot cake").id,
        price: 90,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 10\" diameter, carrot cake").id,
        price: 100,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 4\" high, 12\" diameter, carrot cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 8\" diameter, fruit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 9\" diameter, fruit cake").id,
        price: 202.50,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 10\" diameter, fruit cake").id,
        price: 225,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 12\" diameter, fruit cake").id,
        price: 270,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 8\" diameter, fruit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 9\" diameter, fruit cake").id,
        price: 202.50,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 10\" diameter, fruit cake").id,
        price: 225,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 12\" diameter, fruit cake").id,
        price: 270,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 8\" diameter, chocolate biscuit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 9\" diameter, chocolate biscuit cake").id,
        price: 202.50,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 10\" diameter, chocolate biscuit cake").id,
        price: 225,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 12\" diameter, chocolate biscuit cake").id,
        price: 270,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 8\" diameter, chocolate biscuit cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 9\" diameter, chocolate biscuit cake").id,
        price: 202.50,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 10\" diameter, chocolate biscuit cake").id,
        price: 225,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 12\" diameter, chocolate biscuit cake").id,
        price: 270,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 12\" diameter, chocolate biscuit cake").id,
        price: 270,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 8\" diameter, sponge cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 9\" diameter, sponge cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 10\" diameter, sponge cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 12\" diameter, sponge cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 8\" diameter, sponge cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 9\" diameter, sponge cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 10\" diameter, sponge cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 12\" diameter, sponge cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 8\" diameter, carrot cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 9\" diameter, carrot cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 10\" diameter, carrot cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Square 6\" high, 12\" diameter, carrot cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 8\" diameter, carrot cake").id,
        price: 120,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 9\" diameter, carrot cake").id,
        price: 135,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 10\" diameter, carrot cake").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Circular 6\" high, 12\" diameter, carrot cake").id,
        price: 180,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })        
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Guitar 12\"x6\" (small)").id,
        price: 140,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Guitar 18\"x10\" (large)").id,
        price: 200,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        }) 
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Bass Guitar 12\"x6\" (small)").id,
        price: 140,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })        
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Bass Guitar 18\"x10\" (large)").id,
        price: 200,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Drum 12\" (small)").id,
        price: 160,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Drum 12\" (large)").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Drum 12\" (small)").id,
        price: 100,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Drum 12\" (large)").id,
        price: 130,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("1960s VW Beetle 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("1960s VW Beetle 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("BMW Mini Cooper 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("BMW Mini Cooper 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Lamborghini car 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Lamborghini car 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Aston Martin DB5 (Bond car) 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Aston Martin DB5 (Bond car) 10\" length").id,
        price: 190,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Truck or bus 10\" length").id,
        price: 210,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Truck or bus 10\" length").id,
        price: 210,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Edible ribbon & bow - please choose a colour").id,
        price: 20,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("2D flowers - please choose a colour").id,
        price: 10,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D flowers - 2\" (each) - please choose a type").id,
        price: 10,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("2D computer-printed edible image (cake sides)").id,
        price: 10,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D edible character / figure - 4\" tall").id,
        price: 20,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3d inedible character / figure - 4\" tall").id,
        price: 20,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D person 4\" tall - simple version").id,
        price: 25,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D person 4\" tall - detailed version").id,
        price: 40,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D vehicle 4\" long").id,
        price: 20,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D vehicle 8\" long").id,
        price: 30,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D animal 4\" tall").id,
        price: 20,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D animal 6\" tall").id,
        price: 25,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("Bride & Groom topper").id,
        price: 150,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("3D object - to your requirements").id,
        price: 25,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })
   ProductPrice.create({
        start_at: "2012-12-01".to_date,
        finish_at: "2099-12-31".to_date,
        product_id: Product.find_by_name("2D computer-printed image (cake top surface)").id,
        price: 10,
        currency_id: GeneralSetting.first.default_currency_id,        
        created_by: User.find_by_login("ger.arnold@gmail.com").id,
        updated_by: nil
        })


  PayPalStatus.destroy_all
  PayPalStatus.create({name: "Paid", description: "The transaction has been confirmed as paid.", pending_authorisation: false, paid_sale: true, charged_back: false})
  PayPalStatus.create({name: "Chargeback", description: "The transaction has been charged back.  This usually means fraud.", pending_authorisation: false, paid_sale: false, charged_back: true})
  PayPalStatus.create({name: "Pending", description: "The transaction has been marked as pending by PayPal.", pending_authorisation: true, paid_sale: false, charged_back: false})


  FinishedProductIngredient.destroy_all
  fp  = FinishedProduct.find_by_product_name("Aston Martin DB5 Car Birthday Cake")
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("Aston Martin DB5 (Bond car) 10\" length").id,
        global_options_list_choice: "",
        product_options_list_choice: "Sponge - vanilla",
        quantity: 1,
        user_description: "Include weapons on car"
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("Filling").id,
        global_options_list_choice: "",
        product_options_list_choice: "Vanilla buttercream",
        quantity: 1,
        user_description: ""
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("Covering - please choose a colour").id,
        global_options_list_choice: "Light gray",
        product_options_list_choice: "",
        quantity: 1,
        user_description: "Silver"
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("3D edible character / figure - 4\" tall").id,
        global_options_list_choice: "",
        product_options_list_choice: "",
        quantity: 1,
        user_description: "Daniel Craig Bond"
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("2D computer-printed image (cake top surface)").id,
        global_options_list_choice: "",
        product_options_list_choice: "",
        quantity: 1,
        user_description: "007 Backdrop"
        })
  fp  = FinishedProduct.find_by_product_name("Shoe and a Box Birthday Cake")
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("Square 4\" high, 12\" diameter, sponge cake").id,
        global_options_list_choice: "",
        product_options_list_choice: "Chocolate",
        quantity: 1,
        user_description: ""
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("Filling").id,
        global_options_list_choice: "",
        product_options_list_choice: "Chocolate buttercream",
        quantity: 1,
        user_description: ""
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("Covering - please choose a colour").id,
        global_options_list_choice: "Dark pink",
        product_options_list_choice: "",
        quantity: 1,
        user_description: "Purple"
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("3D flowers - 2\" (each) - please choose a type").id,
        global_options_list_choice: "",
        product_options_list_choice: "Carnation",
        quantity: 2,
        user_description: "Purple & white"
        })
      FinishedProductIngredient.create({finished_product_id: fp.id,
        product_id: Product.find_by_name("3D object - to your requirements").id,
        global_options_list_choice: "",
        product_options_list_choice: "",
        quantity: 1,
        user_description: "Shoe"
        })


  ProductionQuotum.auto_generate


  ShoppingCart.destroy_all
  ShoppingCart.create({customer_id: Customer.first.id,  pay_pal_status_id: PayPalStatus.find_by_name("Paid").id, shopping_cart_status_id: ShoppingCartStatus.find_by_name("Paid").id})
  
  Cake.destroy_all
  Cake.create({shopping_cart_id: ShoppingCart.first.id, cake_required_at: "2013-04-23 15:00:00", special_occasion: "Birthday", name_to_appear_on_cake: "Dan", general_description_from_customer: "A birthday cake for Dan", confectioners_notes: "", based_on_finished_product_id: nil})

  
  ShoppingCartItem.destroy_all
  ShoppingCartItem.create({cake_id: Cake.first.id, product_id: Product.first.id, product_options_list_choice: "", product_price_id: ProductPrice.first.id, quantity: 1, global_options_list_choice: "Purple", user_description: ""})
  
  puts "Completed OK"
  # That's it!
  
end