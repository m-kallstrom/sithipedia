class Article < ApplicationRecord
  has_many :versions
  has_one :category, through: :versions
  belongs_to :author, class_name: "User"
end
