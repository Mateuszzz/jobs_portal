require 'rails_helper'
 
feature 'User log out' do
  
  let(:user) { FactoryGirl.create(:user) } 
  
  scenario 'user log out' do 
    login(user)
    logout()
    
    expect(page).to have_content "Logout Successful!"
  end

end