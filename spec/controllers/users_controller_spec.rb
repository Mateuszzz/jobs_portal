require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    before do
      get :new
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the new template" do
      expect(response).to render_template(:new)
    end
  end
  
  describe "Post #create" do
    
    context 'when data is valid' do  
      it "redirect to user" do
        post :create, user: attributes_for(:user)
      
        expect(response).to redirect_to(user_path(assigns[:user]))
      end
    end
    
    context 'when data is invalid' do
      before do
         post :create, user: attributes_for(:user, password: "")
      end
      
      it "returns http success" do
        expect(response).to be_success
      end
      
      it "renders the new template" do      
        expect(response).to render_template(:new)
      end
    end
  end
  
  describe "GET #index" do
    before do
      get :index
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show/:id" do
    let(:user) { FactoryGirl.create(:user) }
    
    before do
      get :show, id: user
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET edit/:id" do
    let(:user) { FactoryGirl.create(:user) }
    
    before do
      get :edit, id: user
    end
    
    it "returns http success" do
      expect(response).to be_success
    end
    
    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end
  
  describe "PUT 'update/:id'" do
    let(:user) { FactoryGirl.create(:user) }
    
    context "when data is valid" do    
      it "redirect to user" do
        put :update, id: user, user: attributes_for(:user, first_name: "John")
        
        expect(response).to redirect_to(user)
      end
    end
    
    context "when data is invalid" do
      before do
        put :update, id: user, user: attributes_for(:user, first_name: "")
      end
        
      it "returns http success" do
        expect(response).to be_success
      end
      
      it "renders the new template" do      
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Delete destroy/:id" do
    let(:user) { FactoryGirl.create(:user) }
    
    it "redirect to home page" do
      delete :destroy, id: user
      
      expect(response).to redirect_to(root_path)
    end
  end  
end
