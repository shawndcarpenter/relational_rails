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
end