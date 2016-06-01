FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet.email }
  end
end