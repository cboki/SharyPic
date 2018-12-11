# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "byebug"

puts 'Cleaning up database...'
User.destroy_all
puts 'Cleaned all the users...'
Event.destroy_all
puts 'Cleaned all the events...'
Eventguest.destroy_all
puts 'Cleaned all the eventguests...'
Photo.destroy_all
puts 'Cleaned all the photos...'
Tag.destroy_all
puts 'Cleaned all the tags...'
Phototag.destroy_all
puts 'Cleaned all the phototags...'
Like.destroy_all
puts 'Cleaned all the likes...'
Comment.destroy_all
puts 'Cleaned all the comments...'
Like.destroy_all
puts 'Cleaned all the likes...'

puts 'DATEBASE IS CLEAN!!!'

github_names = ['welan125','BenDu89','carolinalemos','sisserian','kauredo','UpClelia','cboki','dfmore','jonnymarshall','mlrcbsousa','matbrg','pbusby','Bitais']

50.times do
  photo_for_avatar = github_names.sample
  user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    professional: false,
    photo: "https://kitt.lewagon.com/placeholder/users/#{photo_for_avatar}"
    )
  user.save
end
puts 'Created 50 new users...'

user_id = 1
50.times do
  event = Event.new(
    user_id: user_id,
    name: Faker::Esport.event,
    location: Faker::Address.city,
    radius: rand(500..1000),
    start_date: Faker::Date.forward(100),
    )
  user_id += 1
  event.save
end
puts 'Created 50 new event...'

250.times do
  eventguest = Eventguest.new(
    event_id: rand(1..50),
    user_id: rand(1..50)
    )
  eventguest.save
end
puts 'Created 250 new guestevent...'

photo_urls = [ 'https://cdn.shopify.com/s/files/1/0684/3259/files/5.jpg',
               'https://cdn.shopify.com/s/files/1/0684/3259/files/4_9465cdb2-b026-4cec-bc32-7fcdf4e90604.jpg',
               'https://cdn.shopify.com/s/files/1/0684/3259/files/2_8c8fa4cc-8140-4558-a2aa-c1b7d9276959.jpg',
               'https://cdn.shopify.com/s/files/1/0684/3259/files/5N1A9329.jpg',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea57f103ce646e4cecd944/1531054157761/paris-photographers-1.jpg',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea57f8562fa782f1b06cbc/1531054157766/paris-photographers-3.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aea58290e2e725df95aba58/1531054157768/paris-photographers-4.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5a0a242f9140b7f3b7e63ced/5aeafb17352f537f2ea43e3e/1531054157769/paris-photographers-5.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/59568fb803596ee34c0d8054/1531054157788/paris-photographer+1.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/59568ff472af657b60300a22/1531054157790/paris-photographer+2.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/5956900bb6ac50c34ea35743/1531054157792/paris-photographer.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/59568fb71e5b6ca37129f731/5956902c86e6c093be88428b/1531054157793/paris-photographers.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5bc6dfb353450aa3a7736f92/5bc6dfd5e2c483c657dd1f18/1539760161537/lisbon-photographers-3.jpg?format=500w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5bc6dfb353450aa3a7736f92/5bc6e010eef1a12e14c5e3eb/1539760183125/lisbon-photographers-5.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/58fe3950ff7c500a04eea88e/58fe395d8419c2c6c89df19a/1493055993563/Lisbon-Photographer+5.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5ab593bc03ce64865010c7b3/5ab593ed562fa77d176c92da/1521849365435/berlin-photographer-3.jpg?format=750w',
               'https://static1.squarespace.com/static/52094b1be4b0f6f84d966b0f/5ab593bc03ce64865010c7b3/5ab593c48a922d7af06ede18/1521849336701/berlin-photographer-1.jpg?format=750w']

500.times do
  user = User.all.sample
  until user.events.count > 0
    user = User.all.sample
  end
  photo = Photo.new(
    file: photo_urls.sample,
    user_id: user.id,
    event_id: user.events.sample.id
    )
  photo.save
end
puts 'Created 500 new photos...'

tags = %w[ dog house star phone girl men t-shirt shirt laptop headphones cup jacket face backpack cable food bottle]

tags.each do |arr|
  tag_new = Tag.new(
    name: arr
  )
  tag_new.save
end
puts 'Created 17 new tags...'

200.times do
  phototag = Phototag.new(
    tag_id: rand(1..17),
    photo_id: rand(1..500)
    )
  phototag.save
end
puts 'Created 200 new phototags...'

250.times do
  like = Like.new(
    user: User.all.sample,
    photo_id: rand(1..500)
    )
  like.save
end
puts 'Created 250 new likes...'

100.times do
  event = Event.all.sample
  comment = Comment.new(
    user: User.all.sample,
    content: Faker::SiliconValley.quote
    )
    comment.update_attribute(:commentable,event)
end
puts 'Created 100 new comments on events...'

100.times do
  photo = Photo.all.sample
  comment = Comment.new(
    user: User.all.sample,
    content: Faker::SiliconValley.quote
    )
    comment.update_attribute(:commentable,photo)
end
puts 'Created 100 new comments on photos...'

puts 'Seeding DONE!!!'

# OLD CODE

