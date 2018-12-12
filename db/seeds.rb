require 'faker'
require 'byebug'

puts 'Cleaning up database...'
EventGuest.destroy_all
puts 'Cleaned all the eventguests...'
PhotoTag.destroy_all
puts 'Cleaned all the phototags...'
Comment.destroy_all
puts 'Cleaned all the comments...'
Like.destroy_all
puts 'Cleaned all the likes...'
Photo.destroy_all
puts 'Cleaned all the photos...'
Event.destroy_all
puts 'Cleaned all the events...'
Tag.destroy_all
puts 'Cleaned all the tags...'
Like.destroy_all
puts 'Cleaned all the likes...'
User.destroy_all
puts 'Cleaned all the users...'

puts 'DATABASE IS CLEAN!!!'

github_names = %w[welan125 BenDu89 carolinalemos sisserian kauredo UpClelia cboki dfmore jonnymarshall mlrcbsousa matbrg pbusby Bitais]

50.times do
  photo_for_avatar = github_names.sample
  user = User.create(
    email: Faker::Internet.email,
    password: '123456',
    professional: false,
    photo: 'https://kitt.lewagon.com/placeholder/users/#{photo_for_avatar}'
  )
end
puts 'Created 50 new users...'

PLACES = ['Praça do Comerçio, Lisboa', 'Tour Eiffel, Paris', 'Place de la Concorde, Paris', 'Avenida Paulista, Sao Paulo',
          'Avenida Atlantica, Rio de Janeiro', 'Avenida Almirante Reis, Lisboa', 'Rua Augusta, Lisboa', 'Cais do Sodré, Lisboa',
          'Rua de Sao Paulo, Lisboa', 'Avenida da Liberdade, Lisboa']

User.all.each do |user|
  event = Event.create(
    creator: user,
    name: Faker::Esport.event,
    location: PLACES.sample,
    radius: rand(500..1000),
    start_date: Faker::Date.forward(100),
  )
end
puts 'Created an event for all users...'

250.times do
  eventguest = EventGuest.create(
    event: Event.all.sample,
    user: User.all.sample
  )
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
  photo = Photo.create(
    file: photo_urls.sample,
    user: user,
    event_id: user.events.sample.id
  )
end
puts 'Created 500 new photos...'

tags = %w[ dog house star phone girl men t-shirt shirt laptop headphones cup jacket face backpack cable food bottle]

tags.each do |arr|
  tag_new = Tag.create(
    name: arr
  )
end
puts 'Created 17 new tags...'

200.times do
  phototag = PhotoTag.create(
    tag: Tag.all.sample,
    photo: Photo.all.sample
  )
end
puts 'Created 200 new phototags...'

250.times do
  like = Like.create(
    user: User.all.sample,
    photo: Photo.all.sample
  )
end
puts 'Created 250 new likes...'

100.times do
  comment = Comment.create(
    user: User.all.sample,
    content: Faker::SiliconValley.quote,
    commentable: Event.all.sample
  )
  # comment.update_attribute(:commentable,event)
end
puts 'Created 100 new comments on events...'

100.times do
  comment = Comment.create(
    user: User.all.sample,
    content: Faker::SiliconValley.quote,
    commentable: Photo.all.sample
  )
end
puts 'Created 100 new comments on photos...'

puts 'Seeding DONE!!!'
