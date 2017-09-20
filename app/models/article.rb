class Article < ApplicationRecord
  has_many :versions
  belongs_to :author, class_name: "User"

  def self.last_version(array)
    array.map { |article| article.versions.last }
  end

end
