require 'rails_helper'

RSpec.describe 'the orchestras index page' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    @los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)
  end
  
  # User Story 1, Parent Index
  it 'displays all of the names of the orchestras' do
    visit "/orchestras"

    expect(page).to have_content(@colorado.name)
    expect(page).to have_content(@portland.name)
   # expect(page).to_not have_content(los_angeles.name)
  end

  # User Story 6, Parent Index Sorted by Most Recently Created
  it 'displays all of the names of the orchestras in order by most recently created' do
    visit "/orchestras"

    expect(@portland.name).to appear_before(@colorado.name)
  end

  # User Story 8, Child Index Link
  it 'has a child index link' do
    visit "/orchestras"

    expect(page).to have_link("All Musicians")

    click_link "All Musicians"

    expect(current_path).to eq('/musicians/')
  end

  # User Story 9, Parent Index Link
  it 'has a parent index link' do
    visit "/orchestras"

    expect(page).to have_link("All Orchestras")

    click_link "All Orchestras"

    expect(current_path).to eq('/orchestras/')
  end
end