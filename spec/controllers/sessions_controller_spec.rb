require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

let!(:author) { User.create(
                            username: "DarthDarth",
                            email: "darth@darth.com",
                            password: "darth"
                          )}



  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # describe "POST #create" do
  #   it "responds with status code 422 for invalid input" do
  #     post :create, { :user => { email: "darth@darth.com", password: "darth" } }
  #     expect(response).to have_http_status 422
  #   end
  # end

  # describe "GET#destroy" do
  #   it "responds with status code 200" do
  #     get :destroy, { user_id: author.id }
  #     expect(response).to have_http_status 200
  #   end
  # end

end
