# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
@portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
@los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)

@kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
@dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
@paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
@delcho = @colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
@annamaria = @colorado.musicians.create!(name: 'Annamaria Vasmatzidis', on_leave: false, instrument: 'violin', position: 2, years_active: 1)
@basil = @colorado.musicians.create!(name: 'Basil Vendryes', on_leave: false, instrument: 'viola', position: 4, years_active: 2)
@august = @colorado.musicians.create!(name: 'August Ramos', on_leave: false, instrument: 'bass', position: 1, years_active: 7)
@roger = @colorado.musicians.create!(name: 'Roger Soren', on_leave: false, instrument: 'contrabassoon', position: 1, years_active: 36)
