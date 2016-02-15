require 'rails_helper'
 
feature 'User edit profile' do
  
  let(:user) { FactoryGirl.create(:user) } 
  
  scenario 'with valid data' do 
    login(user)
    edit_profile(user)
    
    expect(page).to have_content("Profile successfully updated")
  end
  
  scenario 'with invalid data' do
    second_user = build(:user, first_name: "")
    
    login(user)
    edit_profile(second_user)
    
    expect(page).to have_selector('div.alert.alert-danger')
  end
end