require 'spec_helper'

describe VideosController do
  describe "GET show" do
    it "sets @video for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "sets @review for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      review1 = Fabricate(:review, video: video)
      review2 = Fabricate(:review, video: video)
      get :show, id: video.id
      expect(assigns(:reviews)).to  match_array([review1, review2])
    end

    it "redirects user to the sign in page for unauthenticated user" do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe "GET search" do
    it "sets @result for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video, title: 'Test123')
      get :search, search_term: '123'
      expect(assigns(:results)).to eq([video])
    end

    it "redirects user to the sign in page for unauthenticated user" do
      video = Fabricate(:video, title: 'Test123')
      get :search, search_term: '123'
      expect(response).to redirect_to sign_in_path
    end
  end
end