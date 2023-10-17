class Musician < ApplicationRecord
  belongs_to :orchestra

  def self.more_than(years)
    where("years_active > ?", years)
  end

  def self.on_leave   
    where(on_leave: :true)
  end
end