require 'rails_helper'

RSpec.describe 'the orchestras show page' do
  # user story 2, parent show
  it 'displays the name of the orchestra' do
    orchestra = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    visit "/orchestras/#{orchestra.id}"
    expect(page).to have_content(orchestra.name)
  end

  it 'displays the attributes of the orchestra' do
    orchestra = Orchestra.create!(name: 'Colorado Symphony', active: true, city: 'Denver', total_conductors: 5)
    visit "/orchestras/#{orchestra.id}"
    expect(page).to have_content(orchestra.city)
    expect(page).to have_content(orchestra.total_conductors)
  end
end