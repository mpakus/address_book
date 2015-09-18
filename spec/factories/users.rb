FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }

    after(:create) do |user|
      create_list(:email, 3, user: user)
      create_list(:phone, 2, user: user)
    end
  end
end
