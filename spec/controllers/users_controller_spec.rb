require 'rails_helper'

RSpec.describe UsersController, type: :controller do

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

  describe "GET #index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "responds with status code 422 for invalid input" do
      post :create, { :user => { username: "DarthDarth",
                                 email: "darth@darth.com",
                                 password: "darth" } }
      expect(response).to have_http_status 422
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: author.id }
      expect(response).to have_http_status 200
    end
  end

end
