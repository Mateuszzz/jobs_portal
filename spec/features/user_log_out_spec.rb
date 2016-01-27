require 'rails_helper'
 
feature 'User log out' do
  
  let(:user) { FactoryGirl.create(:user) } 
  
  scenario 'when click log out button' do 
    login(user)
    logout()
    
    expect(page).to have_content("Logout Successful!")
  end

end