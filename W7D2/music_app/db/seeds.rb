# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all
Album.destroy_all
User.destroy_all

kevin = User.create(email: 'kevin@kevin.com', password: 'password')
rachael = User.create(email: 'rachael@rachael.com', password: 'password')
anne = User.create(email: 'anne@anne.com', password: 'password')

scrantonicity = Band.create(name: 'Scrantonicity')
mouse_rat = Band.create(name: 'Mouse Rat')
best_band = Band.create(name: 'Best Band')

the_awesome_album = Album.create!(title: 'The Awesome Album', year: 2021, live?: false, band_id: mouse_rat.id)
