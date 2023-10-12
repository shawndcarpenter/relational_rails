require 'rails_helper'

RSpec.describe 'the orchestras index page' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    @los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)
  end
  
  # user story 1, parent index
  it 'displays all of the names of the orchestras' do
    visit "/orchestras"

    expect(page).to have_content(colorado.name)
    expect(page).to have_content(portland.name)
   # expect(page).to_not have_content(los_angeles.name)
  end

end