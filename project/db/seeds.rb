# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#ROLES

admin = Role.create(role: "admin")



#USERS
user1 = User.create(first_name: "Administration", last_name: "Adminsson", email: "admin@admin.se", password: "123456", password_confirmation: "123456")
user2 = User.create(first_name: "Alfa", last_name: "Alfasson", email: "alfa@alfa.se", password: "123456", password_confirmation: "123456")
user3 = User.create(first_name: "Beta", last_name: "Betasson", email: "beta@beta.se", password: "123456", password_confirmation: "123456")


#API's
api1 = Api.create(key: "aaaaaa", application: "app1")
api2 = Api.create(key: "bbbbbb", application: "app2")
api3 = Api.create(key: "cccccc", application: "app3")
api4 = Api.create(key: "dddddd", application: "app4")
api5 = Api.create(key: "eeeeee", application: "app5")
api6 = Api.create(key: "ffffff", application: "app6")
api7 = Api.create(key: "gggggg", application: "app7")

#User 1
user1.roles << admin
user1.apis << api1
user1.apis << api2


#user2
user2.apis << api3
user2.apis << api4

#User 3
user3.apis << api5
user3.apis << api6
user3.apis << api7






