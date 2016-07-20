FactoryGirl.define do
  factory :tweet do
    after(:create) do |tweet|
      3.times.each do
        tweet.lines << create(:line)
      end
    end
  end
end