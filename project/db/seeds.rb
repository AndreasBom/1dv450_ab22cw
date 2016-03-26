# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#########################
#Server(rails) applikationen
#########################
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

#########################
#Klient(AngularJS) applikationen
#########################


creator =  Creator.create(creatorname: "User1", email: "and@bom.se", password: "123456", password_confirmation: "123456")

tag1 = Tag.create(name: "Lilla Syltan")
tag2 = Tag.create(name: "Öl")
tag3 = Tag.create(name: "Taggen")
tag4 = Tag.create(name: "TagPuben")
tag5 = Tag.create(name: "Tag0")
tag6 = Tag.create(name: "Tag1")
tag7 = Tag.create(name: "Tag2")
tag8 = Tag.create(name: "Tag3")
tag9 = Tag.create(name: "Tag4")

#Event 1
event = Event.create(name: 'Lilla puben*', rating: 3, message: "Lilla puben Bla, Bla, Bla, Bla")
position = Position.create(name: "Lilla puben*", address: "Larmgatan, Kalmar")
event.position = position
event.tags << tag1
event.tags << tag2


#Event 2
event = Event.create(name: "Harrys*", rating: 4, message: "Harrys Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "Harrys*", address: "Byxelkrok")
event.position = position
event.tags << tag8
event.tags << tag3
event.tags << tag2

#Event 3
event = Event.create(name: "Lilla Syltan*", rating: 4, message: "Lilla Syltan Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "Lilla Syltan*", address: "Första långgatan, Göteborg")
event.position = position
event.tags << tag5
event.tags << tag7
event.tags << tag1


#Event 4
event = Event.create(name: "Murries*", rating: 2, message: "Murries Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "Murries*", address: "Simrishamnsgatan, Malmö")
event.position = position
event.tags << tag9
event.tags << tag6
event.tags << tag2
event.tags << tag4


#Event 5
event = Event.create(name: "Stora Hotellet*", rating: 2, message: "Stora Hotellet Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "Stora Hotellet*", address: "Storgatan, Växjö")
event.position = position
event.tags << tag9


#Event 6
event = Event.create(name: "Ölstället*", rating: 4, message: "Ölstället Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "Ölstället*", address: "Halmstad")
event.position = position
event.tags << tag2
event.tags << tag5
event.tags << tag4

#Event 7
event = Event.create(name: "BeerMe*", rating: 1, message: "BeerMe Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "BeerMe*", address: "Åmål")
event.position = position
event.tags << tag3
event.tags << tag7
event.tags << tag8

#Event 8
event = Event.create(name: "Ballakinen*", rating: 1, message: "Ballakinen Bla, Bla, Bla, Bla Bla, Bla, Bla, Bla")
position = Position.create(name: "Ballakinen*", address: "Jönköping")
event.position = position
event.tags << tag2
event.tags << tag7




