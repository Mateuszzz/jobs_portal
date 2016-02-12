require 'rails_helper'

RSpec.describe Job, :type => :model do
  
  let(:job) { FactoryGirl.build(:job) }
    
  it "is valid with correct data" do
    expect(job).to be_valid
  end
  
  it "is invalid without a user id" do
    job.user_id = nil
    expect(job).not_to be_valid
  end
  
  it "is invalid without a category id" do
    job.category_id = nil
    expect(job).not_to be_valid
  end
  
  it "is invalid without a title" do
    job.title = nil
    expect(job).not_to be_valid
  end
    
  it "is invalid with too short title" do
    job.title = "aaaa"
    expect(job).not_to be_valid
  end
    
  it "is invalid with too long title" do
    job.title = "a" * 76
    expect(job).not_to be_valid
  end
  
  it "is invalid without a description" do
    job.description = nil
    expect(job).not_to be_valid
  end
    
  it "is invalid with too short description" do
    job.description = "a" * 24
    expect(job).not_to be_valid
  end
    
  it "is invalid with too long description" do
    job.description = "a" * 10001
    expect(job).not_to be_valid
  end
  
  it "is invalid without a company" do
    job.company = nil
    expect(job).not_to be_valid
  end
    
  it "is invalid with too short company" do
    job.company = "aa"
    expect(job).not_to be_valid
  end
    
  it "is invalid with too long company" do
    job.company = "a" * 76
    expect(job).not_to be_valid
  end
  
  it "is invalid without a location" do
    job.location = nil
    expect(job).not_to be_valid
  end
    
  it "is invalid with too short location" do
    job.location = "aa"
    expect(job).not_to be_valid
  end
    
  it "is invalid with too long location" do
    job.location = "a" * 76
    expect(job).not_to be_valid
  end
  
  it "is invalid with a wrong email" do
    emails = %w[tom@test,com tom.co.m tom.tom@test. tom@domen+domen.co.m tomdomen.co]
    emails.each do |email|
      job.email = email
      expect(job).not_to be_valid
    end
  end
end
