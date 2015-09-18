FactoryGirl.define do
  factory :email do
    email  { Faker::Internet.email }
  end
end
