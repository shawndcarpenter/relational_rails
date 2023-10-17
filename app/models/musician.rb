class Musician < ApplicationRecord
  belongs_to :orchestra

  def self.more_than(years)
    where("years_active > ?", years)
  end

  def self.on_leave   
    where(on_leave: :true)
  end

  def self.search(search)
    if search
      musician = Musician.find_by(name: search)
      if musician
        self.where(id: musician)
      else
        Musician.all
      end
    else
      Musician.all
    end
  end
end