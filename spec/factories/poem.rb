FactoryGirl.define do
  factory :poem do
    after(:create) do |poem|
      10.times.each do
        poem.lines << create(:line)
      end
    end
  end

  factory :line do |line|
    line.line_text { Faker::Lorem.sentence }
    line.count 0
  end
end