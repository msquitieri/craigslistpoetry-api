FactoryGirl.define do
  factory :post do |post|
    post.link do
      borough = %w(brx brk mnh wch lgi jsy).sample
      random_number = Faker::Number.number(10)

      "http://newyork.craigslist.org/#{borough}/mis/#{random_number}.html"
    end

    post.processed true
  end
end