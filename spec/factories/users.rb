FactoryGirl.define do
  
  factory :user do
    first_name 'Tom'
    last_name 'Test'
    email 'Tom@test.com'
    password "password"
    password_confirmation "password"
  end
end