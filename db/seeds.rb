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
User.create(first_name: "Dan", last_name: "Laffan", login: "dan.laffan@mac.com", password: "123123", password_confirmation: "123123", user_group_id: UserGroup.find_by_name("Sys Admins").id, active: true)
User.create(first_name: "Julian", last_name: "Arnold", login: "julian.arnold@hotmail.com", password: "123123", password_confirmation: "123123", user_group_id: UserGroup.find_by_name("Sys Admins").id, active: true)
User.create(first_name: "Bob", last_name: "Testcustomerssen", login: "bob@example.com", password: "123123", password_confirmation: "123123", user_group_id: UserGroup.find_by_name("Customers").id, active: true)