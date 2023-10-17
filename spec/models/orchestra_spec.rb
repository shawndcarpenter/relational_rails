require 'rails_helper'

RSpec.describe Orchestra, type: :model do
  it { should have_many :musicians }

  describe "#musicians_count" do
    it 'can count number of musicians in an orchestra' do
      colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
      kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
      dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
      paul = colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 4)
      delcho = colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)

      expect(colorado.musicians_count).to eq(4)
      expect(colorado.musicians_count).to_not eq(3)

    end
  end
  describe "#musicians_alphabetically" do
    it 'can order musicians in an orchestra alphabetically' do
      colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
      kunjing = colorado.musicians.create!(name: 'Kunjing Dai', on_leave: true, instrument: 'viola', position: 1, years_active: 1)
      dmitri = colorado.musicians.create!(name: 'Dmitri Pogorelov', on_leave: false, instrument: 'violin', position: 4, years_active: 7)
      paul = colorado.musicians.create!(name: 'Paul Primus', on_leave: false, instrument: 'violin', position: 2, years_active: 4)
      delcho = colorado.musicians.create!(name: 'Delcho Tenev', on_leave: false, instrument: 'violin', position: 3, years_active: 8)

      expect(colorado.musicians_alphabetically).to eq([delcho, dmitri, kunjing, paul])
      expect(colorado.musicians_alphabetically).to_not eq([paul])
    end
  end

  describe "#search" do
  it 'can find orchestra based on name' do
    colorado = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    portland = Orchestra.create!(name: 'Portland Symphony', active: false, city: 'Portland', total_conductors: 1)
    los_angeles = Orchestra.create!(name: 'Los Angeles Philharmonics', active: true, city: 'Los Angeles', total_conductors: 3)

    expect(Orchestra.search("Colorado Symphony")).to eq([colorado])
    expect(Orchestra.search("Colorado")).to eq([colorado, portland, los_angeles])
    expect(Orchestra.search("Colorado Symphony")).to_not eq([portland])
  end
end
end