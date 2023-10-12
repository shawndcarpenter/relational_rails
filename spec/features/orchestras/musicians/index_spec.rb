require 'rails_helper'

RSpec.describe 'Orchestras musicians index' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    @los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
    @delcho = @portland.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
    @annamaria = @los_angeles.musicians.create!(name: 'Annamaria Vasmatzidis', on_leave: false, instrument: 'bass', position: 2, years_active: 1)
  end

  # user story 5, parent children index
  it 'shows all of the musicians for an orchestra' do
    visit "/orchestras/#{@colorado.id}/musicians"

    expect(page).to have_content(@kunjing.name)
    expect(page).to have_content(@dmitri.name)
    expect(page).to_not have_content(@delcho.name)
    expect(page).to_not have_content(@annamaria.name)
  end

  it 'shows all of the musicians attributes for an orchestra' do
    visit "/orchestras/#{@colorado.id}/musicians"

    expect(page).to have_content(@kunjing.years_active)
    expect(page).to have_content(@kunjing.instrument)
    expect(page).to have_content(@dmitri.position)
    expect(page).to_not have_content(@delcho.years_active)
    expect(page).to_not have_content(@annamaria.instrument)
  end
end