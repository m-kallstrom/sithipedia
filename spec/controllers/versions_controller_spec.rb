require 'rails_helper'

RSpec.describe VersionsController, type: :controller do

  let!(:author) { User.create(
                            username: "DarthDarth",
                            email: "darth@darth.com",
                            password: "darth"
                          )}

  let!(:category) { Category.create(name: "Test Category") }

  let!(:version) { Version.create(
                                editor_id: author.id,
                                title: "Test",
                                body: "This is a test paragraph",
                                category_id: category.id,
                                published: true
                               )}

  # describe "GET #index" do
  #   it "renders the :index template" do
  #     get :index
  #     expect(response).to render_template(:index)
  #   end
  # end

  # describe "GET #show" do
  #   it "responds with status code 200" do
  #     get :show, { id: version.id }
  #     expect(response).to have_http_status 200
  #   end
  # end

end
