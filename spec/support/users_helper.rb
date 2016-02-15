module  UserHelper
 
  def signup(user)
    visit signup_path
    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button 'Create My Account'
  end
  
  def login(user)
    if controller_test?
      request.session[:user_id] = user.id  

    else
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Log in'
    end
  end
  
  def logout()
    click_link 'Log out'
  end
  
  def edit_profile(user)
    click_link('Edit profile')
    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: "new_password"
    fill_in 'user[password_confirmation]', with: "new_password"
    click_button 'Save changes'
  end
  
  def create_category(category)
    click_link('Categories')
    click_link('New category')
    fill_in 'category[name]', with: category.name
    click_button 'Create category'
  end
  
  def controller_test?
      defined?(request)
  end
end