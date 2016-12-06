# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')


# create Meetup Memberships
paul= User.create({provider: "github", uid: "1631404", username: "Paul", email: "example@gmail.com", avatar_url: "http://img06.deviantart.net/3659/i/2004/05/2/e/pink_flower.jpg"} )
  ella = User.create({provider: "github", uid: "w1631403", username: "Ella", email: "example2@gmail.com", avatar_url: "http://www.cardiacathletes.com/images/superheroes/superhero-3.png"} )
  b2 = Meetup.create({name: 'Workout Buffs', description: 'exercise meetup', location: 'Carrolwood'})
  a1 = Meetup.create({name: 'For the Love of Tennis', description: 'tennis enthusiasts meetup', location: 'Brandon'})
  d4 = Meetup.create({name: 'Movie Lovers', description: 'for people who love all movies', location: 'St Pete'})
  c3 = Meetup.create({name: 'Wine & Foodies', description: 'have wine and dinner with a group', location: 'Tampa'})

  MeetupMembership.create({meetup: a1, user: paul, creator_id: true})
  MeetupMembership.create({meetup: a1, user: ella, creator_id: false})
  MeetupMembership.create({meetup: b2, user: ella, creator_id: true})
  MeetupMembership.create({meetup: c3, user: paul, creator_id: true})
  MeetupMembership.create({meetup: d4, user: paul, creator_id: true})
