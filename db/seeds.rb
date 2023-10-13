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

# colorado musicians
@kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
@dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
@paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
@delcho = @colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
@annamaria = @colorado.musicians.create!(name: 'Annamaria Vasmatzidis', on_leave: false, instrument: 'violin', position: 2, years_active: 1)
@basil = @colorado.musicians.create!(name: 'Basil Vendryes', on_leave: false, instrument: 'viola', position: 4, years_active: 2)
@august = @colorado.musicians.create!(name: 'August Ramos', on_leave: false, instrument: 'bass', position: 1, years_active: 7)
@roger = @colorado.musicians.create!(name: 'Roger Soren', on_leave: false, instrument: 'contrabassoon', position: 1, years_active: 36)

#los angeles musicians
@martin = @los_angeles.musicians.create!(name: 'Martin Chalifour', on_leave: false, instrument: 'violin', position: 1, years_active: 1)
@bing = @los_angeles.musicians.create!(name: 'Bing Wang', on_leave: false, instrument: 'violin', position: 1, years_active: 1)
@lyndon = @los_angeles.musicians.create!(name: 'Lyndon Johnston Taylor', on_leave: false, instrument: 'violin', position: 2, years_active: 1)
@chao_hua = @los_angeles.musicians.create!(name: 'Chao-Hua Jin', on_leave: false, instrument: 'violin', position: 2, years_active: 1)
@teng = @los_angeles.musicians.create!(name: 'Teng Li', on_leave: false, instrument: 'viola', position: 1, years_active: 1)
@leticia = @los_angeles.musicians.create!(name: 'Leticia Oaks Strong', on_leave: false, instrument: 'viola', position: 2, years_active: 1)
@dahae = @los_angeles.musicians.create!(name: 'Dahae Kim', on_leave: false, instrument: 'cello', position: 1, years_active: 1)
@christopher = @los_angeles.musicians.create!(name: 'Christopher Hanulik', on_leave: false, instrument: 'bass', position: 1, years_active: 1)
@elise = @los_angeles.musicians.create!(name: 'Elise Shope Henry', on_leave: false, instrument: 'flute', position: 1, years_active: 1)
@sarah_j = @los_angeles.musicians.create!(name: 'Sarah Jackson', on_leave: false, instrument: 'piccolo', position: 1, years_active: 1)
@marion = @los_angeles.musicians.create!(name: 'Marion Arthur Kuszyk', on_leave: false, instrument: 'oboe', position: 1, years_active: 1)
@carolyn_h = @los_angeles.musicians.create!(name: 'Carolyn Hove', on_leave: false, instrument: 'english horn', position: 1, years_active: 1)
@boris_a = @los_angeles.musicians.create!(name: 'Boris Allakhverdyan', on_leave: false, instrument: 'clarinet', position: 1, years_active: 1)
@taylor_e = @los_angeles.musicians.create!(name: 'Taylor Eiffert', on_leave: false, instrument: 'bass clarinet', position: 1, years_active: 1)
@shawn = @los_angeles.musicians.create!(name: 'Shawn Mouser', on_leave: false, instrument: 'bassoon', position: 2, years_active: 1)
@michele_g = @los_angeles.musicians.create!(name: 'Michele Grego', on_leave: true, instrument: 'bassoon', position: 1, years_active: 1)
