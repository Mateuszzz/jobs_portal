require 'rails_helper'

RSpec.describe "categories/new.html.haml", :type => :view do
  
  before do
    category = FactoryGirl.build(:category) 
    assign :category, category
    
    render
  end
  
  it "renders _form partial" do
    expect(view).to render_template(:partial => "_form")
  end
  
  it 'displays a form to create a new user' do
    expect(rendered).to have_tag('form', :with => { :action => '/categories', :method => 'post' }) do
      with_tag "input", :with => { :name => "category[name]", :type => 'text' }
      with_tag "input", :with => { :value => "Create category", :type => 'submit' }
    end
  end
end
