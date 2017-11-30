FactoryBot.define do
  factory :api_partner do
    name { Faker::Business.name }
    api_key { Digest::SHA2.hexdigest(SecureRandom.uuid.to_s).first(30) }
  end
end