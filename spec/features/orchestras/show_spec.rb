require 'rails_helper'

RSpec.describe 'the orchestras show page' do
  before :each do

    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
    @delcho = @colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
  end

  describe "As a visitor" do
    describe "When I visit the orchestra show page" do
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
      it 'displays the number of musicians associated with the orchestra' do
        visit "/orchestras/#{@colorado.id}"
  
        expect(page).to have_content("Musicians: 4")
      end
    end

    describe "When I visit any page on the site" do
      # User Story 8, Child Index Link
      it 'has a musicians index link' do
        visit "/orchestras/#{@colorado.id}"

        expect(page).to have_link("All Musicians")

        click_link "All Musicians"

        expect(current_path).to eq('/musicians/')
      end

      # User Story 9, Parent Index Link
      it 'has an orchestras index link' do
        visit "/orchestras/#{@colorado.id}"

        expect(page).to have_link("All Orchestras")

        click_link "All Orchestras"

        expect(current_path).to eq('/orchestras/')
      end
    end

    describe "When I visit the orchestra show page" do
      # User Story 10, Parent Child Index Link
      it 'links to the orchestra musicians page' do
        visit "/orchestras/#{@colorado.id}"

        expect(page).to have_link("Our Musicians")

        click_link "Our Musicians"

        expect(current_path).to eq("/orchestras/#{@colorado.id}/musicians")
      end

      # User Story 12, Parent Update
      it 'links to orchestra edit page' do
        visit "/orchestras/#{@colorado.id}"

        expect(page).to have_link("Update Orchestra")

        click_link "Update Orchestra"

        expect(current_path).to eq("/orchestras/#{@colorado.id}/edit")
      end

      # User Story 19, Parent Delete 
      it 'can delete orchestra and its musicians records' do
        visit "/orchestras/#{@colorado.id}"

        expect(page).to have_button("Delete Orchestra")

        click_button("Delete Orchestra")

        expect(current_path).to eq("/orchestras")

        expect(page).to_not have_content("Colorado Symphony")

        visit "/musicians"

        expect(page).to_not have_content("Kunjing Dai")
      end
    end
  end
end