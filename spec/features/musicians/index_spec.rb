require 'rails_helper'

RSpec.describe 'Orchestras musicians index' do
  describe "All Records True" do
    before :each do
      @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
      @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
      @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: true, instrument: 'violin', position: 4, years_active: 7)
      @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: true, instrument: 'violin', position: 2, years_active: 17)
      @christopher = @colorado.musicians.create!(name: 'Christopher Hanulik', on_leave: true, instrument: 'bass', position: 1, years_active: 1)
    end

    describe "When I visit the musicians index" do 
      # User Story 3, Child Index
      it 'shows the name of all the musicians' do
        visit '/musicians'

        expect(page).to have_content(@kunjing.name)
        expect(page).to have_content(@dmitri.name)
        expect(page).to have_content(@paul.name)
      end

      it 'shows the attributes of the musicians' do
        visit '/musicians'

        expect(page).to have_content(@kunjing.instrument)
        expect(page).to have_content(@kunjing.position)
        expect(page).to have_content(@dmitri.position)
        expect(page).to have_content(@paul.position)
        expect(page).to have_content(@kunjing.years_active)
        expect(page).to have_content(@dmitri.years_active)
        expect(page).to have_content(@paul.years_active)
      end

      # User Story 8, Child Index Link
      it 'has a child index link' do
        visit "/musicians"

        expect(page).to have_link("All Musicians")

        click_link "All Musicians"

        expect(current_path).to eq('/musicians/')
      end

      # User Story 9, Parent Index Link
      it 'has a parent index link' do
        visit "/musicians"

        expect(page).to have_link("All Orchestras")

        click_link "All Orchestras"

        expect(current_path).to eq('/orchestras/')
      end

      
      # User Story 18, Child Update From Childs Index Page
      it 'can update child info from child index page' do
        visit "/musicians"
        
        expect(page).to have_link("Update Kunjing Dai")
        
        click_link("Update Kunjing Dai")
        
        expect(current_path).to eq("/musicians/#{@kunjing.id}/edit")
      end
      
      # User Story 23, Child Delete From Childs Index Page
      it 'can delete child' do
        visit '/musicians'
        
        expect(page).to have_content("Kunjing Dai")
        expect(page).to have_button("Delete Kunjing Dai")
        
        click_button("Delete Kunjing Dai")
        
        expect(current_path).to eq("/musicians")
        expect(page).to_not have_content("Kunjing Dai")
      end
      
      # Extension 2: Search by name (exact match)
      it 'can search for a musician by name' do
        visit '/musicians'
        
        expect(page).to have_content(@kunjing.name)
        expect(page).to have_content(@christopher.name)
        expect(page).to have_button("Search")
        
        fill_in "search", with: "Kunjing Dai"
        
        click_button("Search")
        
        expect(page).to have_content(@kunjing.name)
        expect(page).to_not have_content(@christopher.name)
        expect(current_path).to eq('/musicians')
      end
    end
  end

  describe "Only Some True Records" do
    describe "When I visit the musicians index page" do
      # User Story 15, Child Index only shows `true` Records
      it 'only shows true records in child index' do
        colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
        kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
        dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
        paul = colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
        christopher = colorado.musicians.create!(name: 'Christopher Hanulik', on_leave: false, instrument: 'bass', position: 1, years_active: 1)
        
        visit "/musicians"
      
        expect(page).to have_content('Kunjing Dai')
        expect(page).to_not have_content('Paul Primus')
        expect(page).to_not have_content('Dmitri Pogorelov')
      end
    end
  end
end