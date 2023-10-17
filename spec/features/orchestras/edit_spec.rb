require 'rails_helper'

RSpec.describe 'edit orchestra page' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    @los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)
  end
  
  describe "As a visitor" do
    # User Story 12, Parent Update
    describe "when I visit an orchestra show page" do
      it 'has a link to update the orchestra' do
        visit "/orchestras/#{@colorado.id}"
        
        expect(page).to have_link("Update Orchestra")
        
        click_link "Update Orchestra"
        
        expect(current_path).to eq("/orchestras/#{@colorado.id}/edit")
      end

      it 'can edit an existing orchestra' do
        visit "/orchestras/#{@colorado.id}/edit"

        fill_in "name", with: "Colorado Philharmonic"
        fill_in "city", with: "Centennial"
        fill_in "total_conductors", with: "2"

        expect(page).to have_button

        click_button

        expect(current_path).to eq("/orchestras/#{@colorado.id}")
        expect(page).to have_content("Colorado Philharmonic")
        expect(page).to have_content("City: Centennial")
        expect(page).to have_content("Conductors: 2")
      end
    end

    describe "When I visit any page on the site" do
      # User Story 8, Child Index Link
      it 'has orchestras index link' do
        visit "/orchestras/#{@colorado.id}/edit"
    
        expect(page).to have_link("All Musicians")
    
        click_link "All Musicians"
    
        expect(current_path).to eq('/musicians/')
      end
    
      # User Story 9, Parent Index Link
      it 'has musicians index link' do
        visit "/orchestras/#{@colorado.id}/edit"
    
        expect(page).to have_link("All Orchestras")
    
        click_link "All Orchestras"
    
        expect(current_path).to eq('/orchestras/')
      end
    end
  end
end