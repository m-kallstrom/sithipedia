class Article < ApplicationRecord
  has_many :versions
  belongs_to :author, class_name: "User"

  def current_published_version
    published_versions = self.versions.select { |version| version.published }
    published_versions.last
  end

  def self.featured
    Article.all.each { |article| article.current_published_version }.sample
  end

end
