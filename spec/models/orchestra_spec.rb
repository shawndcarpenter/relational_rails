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
    end
  end
end