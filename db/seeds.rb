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

clement = User.create!(
    email: 'clement@gmail.com',
    password: 'clement',
    professional: false,
    username: 'Clément',
    photo: "https://kitt.lewagon.com/placeholder/users/cboki"
)

clelia = User.create!(
    email: 'clelia@gmail.com' ,
    password: 'clelia',
    professional: false,
    username: 'Clélia',
    photo: "https://kitt.lewagon.com/placeholder/users/upclelia"
)

max = User.create!(
    email: 'Max@gmail.com' ,
    password: 'maxxxxam',
    professional: false,
    username: 'Max',
    photo: "https://kitt.lewagon.com/placeholder/users/MaxxxxaM"
)

puts 'Created 3 new users...'


ben_birthday = Event.create!(
    creator: clement,
    name: "Ben's birthday",
    location: 'Cascais, Portugal',
    radius: 10,
    start_date: Faker::Date.forward(10),
  )
wagon = Event.create!(
    creator: clelia,
    name: "Incentive trip",
    location: 'Comporta, Portugal',
    radius: 100,
    start_date: Faker::Date.backward(3),
  )

inauguration = Event.create!(
    creator: max,
    name: "Le wagon inauguration",
    location: 'Praça Marquês de Pombal, Lisboa',
    radius: 10,
    start_date: Faker::Date.backward(3),
  )
puts 'Created an event for all users...'


INCENTIVE_PICS = ['https://images.unsplash.com/33/hBd6EPoQT2C8VQYv65ys_White%20Sands.jpg?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
              "https://images.unsplash.com/photo-1470754260170-299cad39501f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
              "https://images.unsplash.com/photo-1535378719329-f0a8b9a42152?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
              "https://images.unsplash.com/photo-1519671282429-b44660ead0a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"]

INAUGURATION = ["https://images.unsplash.com/photo-1497366412874-3415097a27e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                "https://images.unsplash.com/photo-1527153907022-465ee4752fdc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
                "https://res.cloudinary.com/clelia2703/image/upload/v1545145754/inauguration.jpg",
                "https://images.unsplash.com/photo-1497366754035-f200968a6e72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"]

Photo.create!(
    file: "https://res.cloudinary.com/clelia2703/image/upload/v1545140934/photo-1527529482837-4698179dc6ce.jpg",
    user: clement,
    event: ben_birthday
)

Photo.create!(
    file: 'https://images.unsplash.com/photo-1543251069-a9a0bc3f01ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80',
    user: clement,
    event: ben_birthday
)

Photo.create!(
    file: 'https://images.unsplash.com/photo-1518541335015-494e08dc3d8f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80',
    user: clement,
    event: ben_birthday
)

Photo.create!(
    file: "https://images.unsplash.com/photo-1523301343968-6a6ebf63c672?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    user: clement,
    event: ben_birthday
)
INCENTIVE_PICS.each do |pic|
Photo.create!(
    file: pic,
    user: clelia,
    event: wagon
)
end

INAUGURATION.each do |pic|
Photo.create!(
    file:pic,
    user: max,
    event: inauguration
)
end

puts "Created #{Photo.count} new photos..."


puts 'Seeding DONE!!!'


# tags = %w[ dog house star phone girl men t-shirt shirt laptop headphones cup jacket face backpack cable food bottle bride hair]

# tags.each do |arr|
#   tag_new = Tag.create(
#     name: arr
#   )
# end
# puts 'Created 17 new tags...'

# 200.times do
#   phototag = PhotoTag.create(
#     tag: Tag.all.sample,
#     photo: Photo.all.sample
#   )
# end
# puts 'Created 200 new phototags...'

# 250.times do
#   like = Like.create(
#     user: User.all.sample,
#     photo: Photo.all.sample
#   )
# end
# puts 'Created 250 new likes...'

# 100.times do
#   comment = Comment.create(
#     user: User.all.sample,
#     content: Faker::SiliconValley.quote,
#     commentable: Event.all.sample
#   )
#   # comment.update_attribute(:commentable,event)
# end
# puts 'Created 100 new comments on events...'

# 100.times do
#   comment = Comment.create(
#     user: User.all.sample,
#     content: Faker::SiliconValley.quote,
#     commentable: Photo.all.sample
#   )
# end
# puts 'Created 100 new comments on photos...'

# PLACES = ['Praça do Comerçio, Lisboa', 'Rua Heliodoro Salgado 10, Lisboa', 'Rua andrade, Lisboa', 'Avenida Paulista, Sao Paulo',
#           'Avenida Atlantica, Rio de Janeiro', 'Avenida Almirante Reis, Lisboa', 'Rua Augusta, Lisboa', 'Cais do Sodré, Lisboa',
#           'Rua de Sao Paulo, Lisboa', 'Avenida da Liberdade, Lisboa']

# GUESTEVENTS = [ "Ben's birthday", "Mathilde 80's party", "Disney's family trip", "Rui's celebration", "Max crowdfunding meeting",
#             "Madona's concert", "Le wagon incentive trip", "Batch 666 hell's diner", " Shannon inaugural speech"

# 250.times do
#   eventguest = EventGuest.create(
#     event: Event.all.sample,
#     user: User.all.sample
#   )
# end
# puts 'Created 250 new guestevent...'

# photo_urls = [ 'https://res.cloudinary.com/mmg420cloud/image/upload/v1544617030/5N1A9329.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544617018/2_8c8fa4cc-8140-4558-a2aa-c1b7d9276959.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616997/5.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616948/lisbon-photographers-5.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616990/4_9465cdb2-b026-4cec-bc32-7fcdf4e90604.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616933/lisbon-photographers-3.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616884/paris-photographers.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616869/paris-photographer.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616855/paris-photographer_2.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616829/paris-photographer_1.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616813/paris-photographers-5.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616800/paris-photographers-4.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616786/paris-photographers-3.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616769/paris-photographers-1.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616699/Lisbon-Photographer_5.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616675/berlin-photographer-3.jpg',
#                'https://res.cloudinary.com/mmg420cloud/image/upload/v1544616655/berlin-photographer-1.jpg']

