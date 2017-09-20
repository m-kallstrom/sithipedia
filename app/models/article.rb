class Article < ApplicationRecord
  has_many :versions
  belongs_to :author, class_name: "User"
end
