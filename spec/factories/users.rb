FactoryGirl.define do
  
  factory :user do
    first_name 'Tom'
    last_name 'Test'
    email 'Tom@test.com'
    password "password"
    password_confirmation "password"
    
    factory :user_with_jobs do
      transient do
        jobs_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:job, evaluator.jobs_count, user: user)
      end
    end
  end
end