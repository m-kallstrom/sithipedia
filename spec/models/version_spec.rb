

require 'rails_helper'

RSpec.describe Version, type: :model do
    let(:author) {User.create(
                          username: "DarthDarth",
                          email: "darth@darth.com",
                          password: "darth"
                        )}

  let(:category) {Category.create(name: "Test Category")}

  let(:version) {Version.new(
                            editor_id: author.id,
                            title: "Test",
                            body: "This is a test paragraph",
                            category_id: category.id,
                            published: true
                           )}


  it "has a title" do
    expect(version.title).to eq "Test"
  end

  it "has a body" do
    expect(version.body).to eq "This is a test paragraph"
  end

  it "has a status for if it's published or not" do
    expect(version.published).to be true
  end

  it "belongs to a category" do
    expect(version.category.name).to eq "Test Category"
  end

  it "belongs to an editor" do
    expect(version.editor.username).to eq "DarthDarth"
  end
end
