class Orchestra < ApplicationRecord
  has_many :musicians, :dependent => :destroy

  def musicians_count
    self.musicians.length
  end
end