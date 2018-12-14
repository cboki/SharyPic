require 'faker'


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
    photo: "https://kitt.lewagon.com/placeholder/users/#{photo_for_avatar}"
  )
end
puts 'Created 50 new users...'

PLACES = ['Praça do Comerçio, Lisboa', 'Rua Heliodoro Salgado 10, Lisboa', 'Rua andrade, Lisboa', 'Avenida Paulista, Sao Paulo',
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

photo_urls = [ 'https://res.cloudinary.com/mmg420cloud/image/upload/v1544617030/5N1A9329.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544617018/2_8c8fa4cc-8140-4558-a2aa-c1b7d9276959.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616997/5.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616948/lisbon-photographers-5.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616990/4_9465cdb2-b026-4cec-bc32-7fcdf4e90604.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616933/lisbon-photographers-3.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616884/paris-photographers.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616869/paris-photographer.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616855/paris-photographer_2.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616829/paris-photographer_1.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616813/paris-photographers-5.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616800/paris-photographers-4.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616786/paris-photographers-3.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616769/paris-photographers-1.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616699/Lisbon-Photographer_5.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616675/berlin-photographer-3.jpg',
               'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616655/berlin-photographer-1.jpg']

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

tags = %w[ dog house star phone girl men t-shirt shirt laptop headphones cup jacket face backpack cable food bottle bride hair]

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
