require 'rails_helper'

RSpec.describe 'the orchestras show page' do
  before :each do

    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
    @delcho = @colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
  end

  # User Story 2, Parent Show
  it 'displays the name of the orchestra' do
    visit "/orchestras/#{@colorado.id}"

    expect(page).to have_content(@colorado.name)
  end

  it 'displays the attributes of the orchestra' do
    visit "/orchestras/#{@colorado.id}"

    expect(page).to have_content(@colorado.city)
    expect(page).to have_content(@colorado.total_conductors)
  end

  # User Story 7, Parent Child Count
  it 'displays the number of children associated with parent' do
    visit "/orchestras/#{@colorado.id}"

    expect(page).to have_content("Musicians: 4")
  end

  # User Story 8, Child Index Link
  it 'has a child index link' do
    visit "/orchestras/#{@colorado.id}"

    expect(page).to have_link("All Musicians")

    click_link "All Musicians"

    expect(current_path).to eq('/musicians/')
  end

  # User Story 9, Parent Index Link
  it 'has a parent index link' do
    visit "/orchestras/#{@colorado.id}"

    expect(page).to have_link("All Orchestras")

    click_link "All Orchestras"

    expect(current_path).to eq('/orchestras/')
  end

  # User Story 10, Parent Child Index Link
  it 'links to the parents childrens page' do
    visit "/orchestras/#{@colorado.id}"

    expect(page).to have_link("Our Musicians")

    click_link "Our Musicians"

    expect(current_path).to eq("/orchestras/#{@colorado.id}/musicians")
  end
end