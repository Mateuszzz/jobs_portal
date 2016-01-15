require 'rails_helper'

RSpec.describe "sessions/new.html.haml", :type => :view do
  
  it 'displays a form to log in user' do   
    render
    
    expect(rendered).to have_tag('form', :with => { :action => '/login', :method => 'post' }) do
      with_tag "input", :with => { :name => "email", :type => 'email' }
      with_tag "input", :with => { :name => "password", :type => 'password' }
      with_tag "input", :with => { :value => "Log in", :type => 'submit' }
    end
  end
end
