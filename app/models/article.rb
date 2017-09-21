class Article < ApplicationRecord
  has_many :versions
  belongs_to :author, class_name: "User"

  validates :title, :body, {presence: true}

  def self.last_version(array)
    array.map { |article| article.versions.last }
  end

  def self.search(word)
    # found = self.where("title like ?", '%#{word}%')
    # OR body like ?", word,
    # select * from where title like '%#{word}%' OR body like '%#{word}%'
    word = word.downcase
    found = Article.all.select do |article|
      article.versions.last.title.downcase.include?(word) || article.versions.last.body.downcase.include?(word)
    end
    return nil if word == "" || found == []
    Article.last_version(found)
  end
end


