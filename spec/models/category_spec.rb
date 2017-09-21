
require 'rails_helper'

RSpec.describe Category, type: :model do
    let(:author) {User.create(
                          username: "DarthDarth",
                          email: "darth@darth.com",
                          password: "darth"
                        )}

  let(:category) {Category.create(name: "Test Category")}

  let(:article) {Article.new(
                            author_id: author.id,
                            editor_id: 1,
                            title: "Test",
                            body: "This is a test paragraph",
                            category_id: category.id,
                            published: true
                           )}

  it "has a name" do
    expect(category.name).to eq "Test Category"
  end

end
