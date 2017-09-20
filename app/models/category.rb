class Category < ApplicationRecord
  has_many :versions
  has_many :articles, through: :versions

end
