require 'rails_helper'

RSpec.describe "users/new.html.haml", :type => :view do
  
  before do
    user = FactoryGirl.build(:user) 
    assign :user, user
    
    render
  end
  
  it "renders _form partial" do
    expect(view).to render_template(:partial => "_form")
  end
  
  it 'displays a form to create a new user' do
    expect(rendered).to have_tag('form', :with => { :action => '/users', :method => 'post' }) do
      with_tag "input", :with => { :name => "user[first_name]", :type => 'text' }
      with_tag "input", :with => { :name => "user[last_name]", :type => 'text' }
      with_tag "input", :with => { :name => "user[email]", :type => 'email' }
      with_tag "input", :with => { :name => "user[password]", :type => 'password' }
      with_tag "input", :with => { :name => "user[password_confirmation]", :type => 'password' }
      with_tag "input", :with => { :value => "Create My Account", :type => 'submit' }
    end
  end
end
