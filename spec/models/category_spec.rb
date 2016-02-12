require 'rails_helper'

RSpec.describe Category, :type => :model do
  
  let(:category) { FactoryGirl.build(:category) }
     
  it "is valid with correct data" do
    expect(category).to be_valid
  end
  
  it "is invalid without a name" do
    category.name = nil
    expect(category).not_to be_valid
  end
    
  it "is invalid with too name" do
    category.name = "a"
    expect(category).not_to be_valid
  end
  
  it "is invalid with too long name" do
    category.name = "a" * 76
    expect(category).not_to be_valid
  end
end
