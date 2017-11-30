FactoryBot.define do
  factory :line do |line|
    line.line_text { Faker::Lorem.sentence }
    line.count 0

    line.association(:post)
  end
end