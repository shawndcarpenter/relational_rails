require "rails_helper"

RSpec.describe "Delete Orchestras" do
  before :each do
    @colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    @kunjing = @colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
    @dmitri = @colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
    @paul = @colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 17)
    @delcho = @colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)
  end

  describe "As a visitor" do
    describe "When I visit an orchestra show page" do
      # User Story 19, Parent Delete 
      it 'has a link to delete orchestra and its musicians records' do
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