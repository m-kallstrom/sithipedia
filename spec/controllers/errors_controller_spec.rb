require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  let!(:author) { User.create(
                            username: "DarthDarth",
                            email: "darth@darth.com",
                            password: "darth"
                          )}

  let!(:category) { Category.create(name: "Test Category")}

  let!(:article) { Article.create(
                                author_id: author.id,
                                editor_id: author.id,
                                title: "Test",
                                body: "This is a test paragraph",
                                category_id: category.id,
                                published: true
                               )}

  describe "GET #unauthorized" do
    it "renders the :unauthorized template" do
      get :unauthorized
      expect(response).to render_template(:unauthorized)
    end
  end

  # describe "GET #jedidetected" do
  #   it "renders the jedidetected template" do
  #     get :jedidetected
  #     expect(response).to render_template(:jedidetected)
  #   end
  # end

end
