require 'rails_helper'

RSpec.describe 'Orchestras musicians index' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    @los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: true, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
    @delcho = @portland.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
    @annamaria = @los_angeles.musicians.create!(name: 'Annamaria Vasmatzidis', on_leave: false, instrument: 'bass', position: 2, years_active: 1)
  end

  describe "As a visitor" do
    describe "when I visit an orchestras musicians index page" do
      # User Story 5, Parent Children Index
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

    describe "When I visit any page on the site" do
      # User Story 8, Child Index Link
      it 'has a child index link' do
        visit "/orchestras/#{@colorado.id}/musicians"
    
        expect(page).to have_link("All Musicians")
    
        click_link "All Musicians"
    
        expect(current_path).to eq('/musicians/')
      end
    
      # User Story 9, Parent Index Link
      it 'has a parent index link' do
        visit "/orchestras/#{@colorado.id}/musicians"
    
        expect(page).to have_link("All Orchestras")
    
        click_link "All Orchestras"
    
        expect(current_path).to eq('/orchestras/')
      end
    end

    describe "when I visit an orchestras musicians index page" do
      # User Story 13, Parent Child Creation
      it 'has a link that directs to a page to create a new musician' do
        visit "/orchestras/#{@colorado.id}/musicians"
        
        expect(page).to have_link("Create Musician")
        
        click_link "Create Musician"
        
        expect(current_path).to eq("/orchestras/#{@colorado.id}/musicians/new")
      end

      it 'allows for musician adoption from an orchestra' do
        visit "/orchestras/#{@colorado.id}/musicians/new"

        fill_in "name", with: "Shawn Dylan"
        fill_in "instrument", with: "violin"
        fill_in "position", with: "3"
        fill_in "years_active", with: "15"
    
        expect(page).to have_button
    
        click_button
    
        expect(current_path).to eq("/orchestras/#{@colorado.id}/musicians")
        expect(page).to have_link("Shawn Dylan")
      end
    
      # User Story 16, Sort Parent's Children in Alphabetical Order by name
      it 'can sort musicians for an orchestra in alphabetical order' do
        visit "/orchestras/#{@colorado.id}/musicians"
    
        expect("Kunjing").to appear_before("Dmitri")
    
        expect(page).to have_link("Sort A-Z")

        click_link("Sort A-Z")
    
        expect(current_path).to eq("/orchestras/#{@colorado.id}/musicians")
        expect("Dmitri").to appear_before("Kunjing")
      end
    
      # User Story 18, Child Update From Childs Index Page
      it 'can link to the page to edit musician info from orchestras musicians page' do
        visit "/orchestras/#{@colorado.id}/musicians"
    
        expect(page).to have_link("Update Kunjing Dai")
    
        click_link("Update Kunjing Dai")
    
        expect(current_path).to eq("/musicians/#{@kunjing.id}/edit")
      end
    
      # User Story 21, Display Records Over a Given Threshold 
      it 'can display musicians with over x years of experience' do
        visit "/orchestras/#{@colorado.id}/musicians"
        expect(page).to have_content("Kunjing Dai")    
        expect(page).to have_content("Only return musicians with more than this many years of experience")
    
        fill_in "years_active", with: "4"
    
        expect(page).to have_button("filter")
    
        click_button("filter")
    
        expect(current_path).to eq("/orchestras/#{@colorado.id}/musicians")
        expect(page).to_not have_content("Kunjing Dai")
      end
    
      # User Story 23, Child Delete From Childs Index Page
      it 'can delete child from parent child index page' do
        visit "/orchestras/#{@colorado.id}/musicians"
    
        expect(page).to have_content("Kunjing Dai")
        expect(page).to have_button("Delete Kunjing Dai")
    
        click_button("Delete Kunjing Dai")
    
        expect(current_path).to eq("/musicians")
        expect(page).to_not have_content("Kunjing Dai")
      end
    end  
  end
end