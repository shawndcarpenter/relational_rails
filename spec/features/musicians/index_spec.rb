require 'rails_helper'

RSpec.describe 'Orchestras musicians index' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
  end
  # user story 3, child index
  it 'shows the name of all the musicians' do
    visit '/musicians'

    expect(page).to have_content(@kunjing.name)
    expect(page).to have_content(@dmitri.name)
    expect(page).to have_content(@paul.name)
  end

  it 'shows the attributes of the musicians' do
    visit '/musicians'

    expect(page).to have_content(@kunjing.instrument)
    expect(page).to have_content(@dmitri.instrument)
    expect(page).to have_content(@paul.instrument)
    expect(page).to have_content(@kunjing.position)
    expect(page).to have_content(@dmitri.position)
    expect(page).to have_content(@paul.position)
    expect(page).to have_content(@kunjing.years_active)
    expect(page).to have_content(@dmitri.years_active)
    expect(page).to have_content(@paul.years_active)
  end
end