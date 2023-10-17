require 'rails_helper'

RSpec.describe 'Musicians delete' do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
  end

  # User Story 20, Child Delete 
  describe "As a visitor" do
    describe "When I visit a musician show page" do
      it 'can delete musician' do
        visit "/musicians/#{@kunjing.id}"
        
        expect(page).to have_link("Delete Musician")
        
        click_link("Delete Musician")
      
        expect(current_path).to eq("/musicians")
      
        expect(page).to_not have_content("Kunjing Dai")
      end
    end

    # User Story 23, Child Delete From Childs Index Page
    describe "When I visit the musicians index page" do
      it 'can delete child' do
        visit '/musicians'

        expect(page).to have_content("Kunjing Dai")
        expect(page).to have_button("Delete Kunjing Dai")

        click_button("Delete Kunjing Dai")

        expect(current_path).to eq("/musicians")
        expect(page).to_not have_content("Kunjing Dai")
      end
    end
  end
end