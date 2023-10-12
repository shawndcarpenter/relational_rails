require 'rails_helper'

RSpec.describe 'the musicians show page' do
  # user story 4, child show
  it 'displays the name of the musician' do
    colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    
    visit "/musicians/#{kunjing.id}"

    expect(page).to have_content(kunjing.name)
    expect(page).to_not have_content(dmitri.name)
  end

  it 'displays the attributes of musician' do
    colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    
    visit "/musicians/#{kunjing.id}"

    expect(page).to have_content(kunjing.instrument)
    expect(page).to have_content(kunjing.position)
    expect(page).to have_content(kunjing.years_active)
    expect(page).to_not have_content(dmitri.position)
  end

end