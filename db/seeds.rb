# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Site.new(
  first_name: 'First',
  last_name: 'Site',
  address: '1981 Farndon Ave',
  lat: 37.341800,
  lng: -122.067790,
  email: 'fake@email.com',
  phone: '123456789'
)