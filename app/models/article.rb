class Article < ApplicationRecord
  has_many :versions
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :title, :body, :editor_id, {presence: true}

  after_save :create_version

  attr_accessor :editor_id

  def self.last_version(array)
    array.map { |article| article.versions.last }
  end

  def self.search(word)
    word = word.downcase
    found = Article.all.select do |article|
      article.versions.last.title.downcase.include?(word) || article.versions.last.body.downcase.include?(word)
    end
    return nil if word == "" || found == []
    Article.last_version(found)
  end

  private

  def create_version
    self.versions.create!({
      title: self.title,
      body: self.body,
      published: self.published,
      category_id: self.category_id,
      editor_id: self.editor_id
    })
  end
end


