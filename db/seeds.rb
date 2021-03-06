# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

comedy = Category.create(name: 'Comedy')
reality = Category.create(name: 'Reality')
animation = Category.create(name: 'Animation')

Video.create(
  title: 'Monk', 
  description: 'Monk is a detective.', 
  small_cover_url: '/tmp/monk.jpg', 
  large_cover_url: '/tmp/monk_large.jpg',
  category: comedy
)
Video.create(
  title: 'Monk', 
  description: 'Monk is a detective.', 
  small_cover_url: '/tmp/monk.jpg', 
  large_cover_url: '/tmp/monk_large.jpg',
  category: comedy
)
Video.create(
  title: 'Monk', 
  description: 'Monk is a detective.', 
  small_cover_url: '/tmp/monk.jpg', 
  large_cover_url: '/tmp/monk_large.jpg',
  category: animation
)
Video.create(
  title: 'Monk', 
  description: 'Monk is a detective.', 
  small_cover_url: '/tmp/monk.jpg', 
  large_cover_url: '/tmp/monk_large.jpg',
  category: animation
)
Video.create(
  title: 'Monk', 
  description: 'Monk is a detective.', 
  small_cover_url: '/tmp/monk.jpg', 
  large_cover_url: '/tmp/monk_large.jpg',
  category: animation
)
monk = Video.create(
  title: 'Monk', 
  description: 'Monk is a detective.', 
  small_cover_url: '/tmp/monk.jpg', 
  large_cover_url: '/tmp/monk_large.jpg',
  category: reality
)

desmond = User.create(
  email: "desmond@123.com",
  password: "098567",
  full_name: "desmond"
)

Review.create(
  user: desmond,
  video: monk,
  rating: 5,
  content: "good movie"
)

Review.create(
  user: desmond,
  video: monk,
  rating: 3,
  content: "bad movie"
)