# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

# That's it!
