require 'rails_helper'
 
feature 'Admin create category' do
  
  let(:user) { FactoryGirl.create(:user, :admin) }
  
  scenario 'with valid data' do 
    login(user)
    category = FactoryGirl.build(:category)
    create_category(category)
    
    expect(page).to have_content "Category successfully created!"
  end
  
  scenario 'with invalid data' do
    login(user)
    category = FactoryGirl.build(:category, name: "")
    create_category(category)
    
    expect(page).to have_selector('div.alert.alert-danger')
  end
end