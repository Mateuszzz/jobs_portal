require 'rails_helper'

RSpec.describe User, :type => :model do
   
  before(:each) do
    @user = User.new(first_name: 'Tom', last_name: 'Tester', email: 'Tom@test.com',
                     password: "password", password_confirmation: "password")
  end
    
  it "is valid with correct data" do
    expect(@user).to be_valid
  end
    
  it "is invalid without a first name" do
    @user.first_name = nil
    expect(@user).not_to be_valid
  end
    
  it "is invalid with too short first name" do
    @user.first_name = "aa"
    expect(@user).not_to be_valid
  end
    
  it "is invalid with too long first name" do
    @user.first_name = "a" * 41
    expect(@user).not_to be_valid
  end

  it "is invalid without a last name" do
    @user.last_name = nil
    expect(@user).not_to be_valid
  end
    
  it "is invalid with too short last name" do
    @user.last_name = "aa"
    expect(@user).not_to be_valid
  end
    
  it "is invalid with too long last name" do
    @user.last_name = "a" * 76
    expect(@user).not_to be_valid
  end
  
  it "is invalid without an email" do
    @user.first_name = nil
    expect(@user).not_to be_valid
  end
  
  it "is invalid with too long email" do
    @user.email = "a" * 248 + "@test.com"
    expect(@user).not_to be_valid
  end
  
  it "is invalid with a wrong email" do
    emails = %w[tom@test,com tom.co.m tom.tom@test. tom@domen+domen.co.m tomdomen.co]
    emails.each do |email|
      @user.email = email
      expect(@user).not_to be_valid
    end
  end
  
  it 'is invalid without a password' do
    @user.password = nil
    expect(@user).not_to be_valid
  end
  
  it "is invalid with too short password" do
    @user.password = "a" * 5
    expect(@user).not_to be_valid
  end
    
  it "is invalid with too long password" do
    @user.password = "a" * 41
    expect(@user).not_to be_valid
  end
  
  it "is invalid with different password and pass_confirmation" do
    @user.password_confirmation = "different_password"
    expect(@user).not_to be_valid
  end
  
  it "is invalid with duplicate email address" do
    @user.save
    @second_user = User.new(first_name: 'Tom2', last_name: 'Tester2', email: 'Tom@test.com',
                            password: "password", password_confirmation: "password")
    expect(@second_user).not_to be_valid
  end
end
