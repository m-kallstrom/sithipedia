class Photo < ApplicationRecord
  has_many :placements
  has_many :versions, through: :placements

end
