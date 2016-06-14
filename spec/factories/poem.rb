FactoryGirl.define do
  factory :poem do
    after(:create) do |poem|
      Poem::LINE_COUNT.times.each do
        poem.lines << create(:line)
      end
    end
  end

  factory :line do |line|
    line.line_text { Faker::Lorem.sentence }
    line.count 0

    line.association(:post)
  end

  factory :post do |post|
    post.link do
      borough = %w(brx brk mnh wch lgi jsy).sample
      random_number = Faker::Number.number(10)

      "http://newyork.craigslist.org/#{borough}/mis/#{random_number}.html"
    end
  end
end