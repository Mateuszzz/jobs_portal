require 'rails_helper'
 
feature 'User profile delete' do
  
  let(:user) { FactoryGirl.create(:user) } 
  
  scenario 'when click delete button' do 
    login(user)
    click_link('Edit profile')
    click_link('Delete your account')
    
    expect(page).to have_content("User successfully destroyed.")
  end
end