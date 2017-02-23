FactoryGirl.define do
  factory :poem do
    after(:create) do |poem|
      Poem::LINE_COUNT.times.each do
        poem.lines << create(:line)
      end
    end
  end
end