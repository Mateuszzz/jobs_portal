require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  describe "GET new" do  
    context 'when user is logged in as admin' do
      before do
        @user = FactoryGirl.create(:user, :admin)
        login(@user)
        get :new
      end
      
      it "returns http success" do
        expect(response).to be_success
      end
    
      it "renders the index template" do
        expect(response).to render_template(:new)
      end
    end
    
    context 'when user is logged in as user' do     
      it "redirect to user path" do
        @user = FactoryGirl.create(:user)
        login(@user)
        get :new
        
        expect(response).to redirect_to(@user)
      end
    end
    
    context 'when user is not logged in' do
      it "redirect to log in path" do
        get :new
        expect(response).to redirect_to(login_path)
      end
    end
  end
  
   describe "POST #create" do
    
    context 'when user is logged in as admin' do
      it "redirect to category path" do
        @user = FactoryGirl.create(:user, :admin)
        login(@user)
        post :create, category: attributes_for(:category)
      
        expect(response).to redirect_to(category_path(assigns[:category]))
      end
    end
    
    context 'when user is logged in as user' do
      it "redirect to user path" do
        @user = FactoryGirl.create(:user)
        login(@user)
        post :create, category: attributes_for(:category)
        
        expect(response).to redirect_to(@user)
      end
    end
    
    context 'when user is not logged in' do
      it "redirect to log in path" do
        post :create, category: attributes_for(:category)
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
