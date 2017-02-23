source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0', '< 5.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production

gem 'twitter'

gem 'therubyracer', platforms: :ruby
gem 'execjs'

group :production, :staging do
  gem 'unicorn'
end

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'will_paginate'
gem 'httparty'
gem 'nokogiri'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Rspec tells you to put it in both development and test groups
  # https://github.com/rspec/rspec-rails#installation
  gem 'rspec-rails', '~> 3.0'
  gem 'faker'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-rails'

  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem 'web-console'

  gem 'annotate'

  # Use Puma as the app server
  gem 'puma'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
