require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the :new template for unauthenticated user" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to home page for authenticated user" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    let(:desmond) { Fabricate(:user) }
    
    context "with valid credentials" do
      before do
        post :create, email: desmond.email, password: desmond.password
      end

      it "puts the signed in user in session" do
        expect(session[:user_id]).to eq(desmond.id)
      end
      it "redirects to the home page" do
        expect(response).to redirect_to home_path
      end
      it "sets the info message" do
        expect(flash[:info]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      before do
        post :create, email: desmond.email, password: desmond.password + "123"
      end

      it "does not put the signed in user in session" do
        expect(session[:user_id]).to be_blank
      end
      it "redirects to the sign in path" do
        expect(response).to redirect_to sign_in_path
      end
      it "sets the danger message" do
        expect(flash[:danger]).not_to be_blank
      end
    end
  end

  describe "GET destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end

    it "clears the session for the user" do
      expect(session[:user_id]).to be_nil
    end
    it "redirects to the root path" do
      expect(response).to redirect_to root_path
    end
    it "sets the info message" do
      expect(flash[:info]).not_to be_blank
    end
  end
end