require 'rails_helper'
 
feature 'User log in' do
  
  let(:user) { FactoryGirl.create(:user) } 
  
  scenario 'with valid data' do 
    login(user)
    
    expect(page).to have_content("Login Successful!")
  end
  
  scenario 'with invalid data' do
    second_user = build(:user, password: "wrong_password")
    login(second_user)
    
    expect(page).to have_content("Invalid email/password combination")
  end
end