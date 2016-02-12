FactoryGirl.define do
  
  factory :job do
    user
    category
    title "RoR Developer"
    description "Working with ............"
    company "ABC"
    location "Cracov"
    email "ABC@test.com"
    active true    
  end
end
