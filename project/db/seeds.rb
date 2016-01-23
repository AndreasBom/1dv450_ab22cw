# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#ROLES
admin = Role.create(role: "admin")
basic = Role.create(role: "basic")


#USERS
user1 = User.create(first_name: "Andreas", last_name: "Bom", email: "ab@se.se")
user2 = User.create(first_name: "Anna", last_name: "Annasson", email: "aa@se.se")
user3 = User.create(first_name: "Beta", last_name: "Betasson", email: "bb@se.se")

#API's
api1 = Api.create(key: "abc123")
api2 = Api.create(key: "101010")
api3 = Api.create(key: "abcdef")
api4 = Api.create(key: "aabbccdd")

#User 1
user1.roles << admin
user1.apis << api1
user1.apis << api2

#user2
user2.roles << basic
user2.apis << api3
user2.apis << api4

#User 3
user3.roles << basic
user3.apis << api2
user3.apis << api1
user3.apis << api3




