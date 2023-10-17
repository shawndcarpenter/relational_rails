class Orchestra < ApplicationRecord
  has_many :musicians, :dependent => :destroy

  def musicians_count
    self.musicians.length
  end

  def musicians_alphabetically
    musicians.order(:name)
  end

  def self.search(search)
    orchestra = Orchestra.find_by(name: search)
    if orchestra
      self.where(id: orchestra)
    else
      Orchestra.all
    end
  end
end