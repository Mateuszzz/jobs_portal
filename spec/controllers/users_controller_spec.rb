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
    
    context 'when user is logged in' do
      before do
        user = FactoryGirl.create(:user)
        login(user)
        get :index
      end
      
      it "returns http success" do
        expect(response).to be_success
      end
    
      it "renders the index template" do
        expect(response).to render_template(:index)
      end
    end
    
    context 'when user is not logged in' do
      it "redirect to login path" do
        get :index
        
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET #show/:id" do
    let(:user) { FactoryGirl.create(:user) }
    
    context 'when user is logged in' do
      before do
        login(user)
        get :show, id: user
      end
      
      it "returns http success" do
        expect(response).to be_success
      end
    
      it "renders the show template" do
        expect(response).to render_template(:show)
      end
    end  
    
    context 'when user is not logged in' do
      it "redirect to login path" do
        get :show, id: user
        
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET edit/:id" do
    let(:user) { FactoryGirl.create(:user) }
    
    context 'when user is logged in' do
      before do
        login(user)
        get :edit, id: user
      end
    
      it "returns http success" do
        expect(response).to be_success
      end
    
      it "renders the edit template" do
        expect(response).to render_template(:edit)
      end
    end
    
    context 'when user is not logged in' do
      it "redirect to login path" do
        get :show, id: user
        
        expect(response).to redirect_to(login_path)
      end
    end  
  end
  
  describe "PUT 'update/:id'" do
    let(:user) { FactoryGirl.create(:user) }
    
    context 'with valid data' do
         
      context "when user is logged in" do
        it "redirect to user" do
          login(user)
          put :update, id: user, user: attributes_for(:user, first_name: "John")
          
          expect(response).to redirect_to(@user)
        end
      end
    
      context "when user is not logged in" do
        it "redirect to user" do
          put :update, id: user, user: attributes_for(:user, first_name: "John")
        
          expect(response).to redirect_to(login_path)
        end 
      end
    end
    
    context 'with invalid data' do
      context "when user is logged in" do
        before do
          login(user)
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
  end

  describe "Delete destroy/:id" do
    let(:user) { FactoryGirl.create(:user) }
    
    context 'when user is logged in' do
      it "redirect to home page" do
        login(user)
        delete :destroy, id: user
      
        expect(response).to redirect_to(root_path)
      end
    end
    
    context 'when user is not logged in' do
      it "redirect to login page" do
        delete :destroy, id: user
      
        expect(response).to redirect_to(login_path)
      end
    end
  end  
end
