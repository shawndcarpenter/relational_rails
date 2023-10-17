require 'rails_helper'

RSpec.describe 'the musicians show page' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
  end

  describe "As a visitor" do
    describe "When I visit a musicians show page" do
      # User Story 4, Child Show
      it 'displays the name of the musician' do   
        visit "/musicians/#{@kunjing.id}"

        expect(page).to have_content(@kunjing.name)
        expect(page).to_not have_content(@dmitri.name)
      end

      it 'displays the attributes of musician' do   
        visit "/musicians/#{@kunjing.id}"

        expect(page).to have_content(@kunjing.instrument)
        expect(page).to have_content(@kunjing.position)
        expect(page).to have_content(@kunjing.years_active)
        expect(page).to_not have_content(@dmitri.position)
      end

      # User Story 8, Child Index Link
      it 'has a musicians index link' do
        visit "/musicians/#{@kunjing.id}"

        expect(page).to have_link("All Musicians")

        click_link "All Musicians"

        expect(current_path).to eq('/musicians/')
      end

      # User Story 9, Parent Index Link
      it 'has an orchestras index link' do
        visit "/musicians/#{@kunjing.id}"

        expect(page).to have_link("All Orchestras")

        click_link "All Orchestras"

        expect(current_path).to eq('/orchestras/')
      end

      # User Story 14, Child Update 
      it 'can update musician' do
        visit "/musicians/#{@kunjing.id}"
        
        expect(page).to have_link("Update Musician")

        click_link "Update Musician"

        expect(current_path).to eq("/musicians/#{@kunjing.id}/edit")
        expect(page).to have_button

        fill_in "instrument", with: "bassoon"
        click_button

        expect(current_path).to eq("/musicians/#{@kunjing.id}")
        expect(page).to have_content("bassoon")
        expect(page).to_not have_content("viola")
      end

      # User Story 20, Child Delete
      it 'can delete musician' do
        visit "/musicians/#{@kunjing.id}"

        expect(page).to have_link("Delete Musician")

        click_link("Delete Musician")

        expect(current_path).to eq("/musicians")

        expect(page).to_not have_content("Kunjing Dai")
      end
    end
  end
end