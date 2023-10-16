class Orchestra < ApplicationRecord
  has_many :musicians, :dependent => :destroy
end