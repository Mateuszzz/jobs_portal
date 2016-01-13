require 'rails_helper'

RSpec.describe "static_pages/home.html.haml", :type => :view do
  
  before do
    render
  end
  
  it "displays a link" do
    expect(rendered).to have_link('Sign up!', href: signup_path)
  end
end
