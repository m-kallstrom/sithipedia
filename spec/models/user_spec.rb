
require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {User.create(
                          username: "DarthDarth",
                          email: "darth@darth.com",
                          password: "darth"
                        )}

  let(:category) {Category.create(name: "Test Category")}

  let(:article) {Article.create(
                            author_id: user.id,
                            editor_id: user.id,
                            title: "Test",
                            body: "This is a test paragraph",
                            category_id: category.id,
                            published: true
                           )}

  let(:version) {Version.create(
                            editor_id: user.id,
                            title: "Test version",
                            body: "This is a test paragraph for the version functionality",
                            category_id: category.id,
                            published: true
                           )}

  it "has a username" do
    expect(user.username).to eq "DarthDarth"
  end

  it "has an email" do
    expect(user.email).to eq "darth@darth.com"
  end

  it "has a default rank of 'Master'" do
    expect(user.rank).to eq "master"
  end

end
