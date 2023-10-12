require 'rails_helper'

RSpec.describe Orchestra, type: :model do
  it { should have_many :musicians }
end