FactoryGirl.define do
  factory :api_partner do
    name { Faker::Business.name }
  end
end