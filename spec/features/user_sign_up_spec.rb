require 'rails_helper'
 
feature 'User sign up' do
  
  scenario 'with valid data' do
    user = FactoryGirl.build(:user) 
    signup(user)
    
    expect(page).to have_content "Signup Successful!"
  end
  
  scenario 'with invalid data' do
    user = FactoryGirl.build(:user, first_name: "", last_name: "", email: "", password: "", password_confirmation: "") 
    signup(user)
    
    expect(page).to have_selector('div.alert.alert-danger')
  end
end