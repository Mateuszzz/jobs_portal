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
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
  end
  
  def logout()
    click_link 'Log out'
  end
end