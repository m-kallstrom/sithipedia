class Category < ApplicationRecord
  has_many :versions
  has_many :articles

end
