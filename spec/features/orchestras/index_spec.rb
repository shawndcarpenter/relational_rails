require 'rails_helper'

RSpec.describe 'the orchestras index page' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    @los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @portland.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
  end
  
  describe "As a visitor" do
    describe "When I visit the orchestras index page" do
      # User Story 1, Parent Index
      it 'displays all of the names of the orchestras' do
        visit "/orchestras"

        expect(page).to have_content(@colorado.name)
        expect(page).to have_content(@portland.name)
      end

      # User Story 6, Parent Index Sorted by Most Recently Created
      it 'displays all of the names of the orchestras in order by most recently created' do
        visit "/orchestras"
  
        expect(@portland.name).to appear_before(@colorado.name)
      end

      it 'displays when record was created next to record' do
        visit "/orchestras"

        expect(page).to have_content(@portland.created_at)
      end
    end
  
    describe "When I visit any page on the site" do
      # User Story 8, Child Index Link
      it 'has a child index link at top of page' do
        visit "/orchestras"

        expect(page).to have_link("All Musicians")
        expect("All Musicians").to appear_before(@colorado.name)

        click_link "All Musicians"

        expect(current_path).to eq('/musicians/')
      end

      # User Story 9, Parent Index Link
      it 'has a parent index link at top of page' do
        visit "/orchestras"

        expect(page).to have_link("All Orchestras")
        expect("All Orchestras").to appear_before(@colorado.name)

        click_link "All Orchestras"

        expect(current_path).to eq('/orchestras/')
      end
    end

    describe "When I visit the orchestras index page" do
      # User Story 11, Parent Creation
      it 'has a link to create a new orchestra' do
        visit "/orchestras"

        expect(page).to have_link("New Orchestra")

        click_link "New Orchestra"

        expect(current_path).to eq('/orchestras/new/')
      end

      # User Story 17, Parent Update From Parent Index Page 
      it 'can update parent info from index page' do
        visit "/orchestras"
  
        expect(page).to have_link("Update Colorado Symphony")
  
        click_link("Update Colorado Symphony")
  
        expect(current_path).to eq("/orchestras/#{@colorado.id}/edit")
      end

      # User Story 22, Parent Delete From Parent Index Page
      it 'next to every orchestra, I see a link to delete that orchestra' do
        visit '/orchestras'
  
        expect(page).to have_content("Colorado Symphony")
        expect(page).to have_button("Delete Colorado Symphony")
  
        click_button("Delete Colorado Symphony")
  
        expect(current_path).to eq("/orchestras")
        expect(page).to_not have_content("Colorado Symphony")
      end

      # Extension 2: Search by name (exact match)
      it 'can search for a name of an orchestra' do
        visit '/orchestras'
    
        expect(page).to have_content(@colorado.name)
        expect(page).to have_content(@portland.name)
        expect(page).to have_button("Search")
    
        fill_in "search", with: "Colorado Symphony"
    
        click_button("Search")
    
        expect(page).to have_content(@colorado.name)
        expect(page).to_not have_content(@portland.name)
        expect(current_path).to eq('/orchestras')
      end
    end
  end
end