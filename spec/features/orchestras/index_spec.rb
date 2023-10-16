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
    expect(page).to have_content(@portland.created_at)
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

  # User Story 11, Parent Creation
  it 'allows creation of new parent' do
    visit "/orchestras"

    expect(page).to have_link("New Orchestra")

    click_link "New Orchestra"

    expect(current_path).to eq('/orchestras/new/')

    fill_in "name", with: "Chicago Symphony Orchestra"
    fill_in "city", with: "Chicago"
    fill_in "total_conductors", with: "3"

    expect(page).to have_button

    click_button

    expect(current_path).to eq('/orchestras')
    expect(page).to have_link("Chicago Symphony Orchestra")

    click_link "Chicago Symphony Orchestra"

    expect(page).to have_content("City: Chicago")
    expect(page).to have_content("Conductors: 3")
    expect(page).to have_content("Musicians: 0")
  end

  # User Story 17, Parent Update From Parent Index Page 
  it 'can update parent info from index page' do
    visit "/orchestras"

    expect(page).to have_link("Update Colorado Symphony")

    click_link("Update Colorado Symphony")

    expect(current_path).to eq("/orchestras/#{@colorado.id}/edit")
  end

  # User Story 22, Parent Delete From Parent Index Page
  it 'can delete parent' do
    visit '/orchestras'

    expect(page).to have_content("Colorado Symphony")
    expect(page).to have_button("Delete Colorado Symphony")

    click_button("Delete Colorado Symphony")

    expect(current_path).to eq("/orchestras")
    expect(page).to_not have_content("Colorado Symphony")
  end
end