require 'rails_helper'

RSpec.describe 'new orchestra page' do
  # User Story 8, Child Index Link
  it 'has a child index link' do
    visit "/orchestras/new"

    expect(page).to have_link("All Musicians")

    click_link "All Musicians"

    expect(current_path).to eq('/musicians/')
  end

  # User Story 9, Parent Index Link
  it 'has a parent index link' do
    visit "/orchestras/new"

    expect(page).to have_link("All Orchestras")

    click_link "All Orchestras"

    expect(current_path).to eq('/orchestras/')
  end

  # User Story 11, Parent Creation
  it 'allows creation of new parent' do
    visit "/orchestras/new"

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
end