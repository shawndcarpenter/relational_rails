require 'rails_helper'

RSpec.describe Musician, type: :model do
  it { should belong_to :orchestra }

  describe "#more_than" do
    it 'can find musician with more than x years active' do
      colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
      kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
      dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
      paul = colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 4)
      delcho = colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)

      expect(colorado.musicians.more_than(4)).to eq([dmitri, delcho])
    end
  end

  describe "#on_leave" do
    it 'can find whether a musician is active' do
      colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
      kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
      dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
      paul = colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 4)
      delcho = colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)

      expect(kunjing.on_leave).to eq(true)
      expect(kunjing.on_leave).to_not eq(false)
      expect(dmitri.on_leave).to eq(false)
      expect(Musician.on_leave).to eq([kunjing])
    end 

    describe "#search" do
      it 'can find orchestra based on name' do
        colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
        kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
        dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
        paul = colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 4)
        delcho = colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)

        expect(Musician.search("Kunjing Dai")).to eq([kunjing])
        expect(Musician.search("Kunjing Dai")).to_not eq([dmitri])
        expect(Musician.search("Kunjing")).to eq([kunjing, dmitri, paul, delcho])

        
      end
    end
  end
end