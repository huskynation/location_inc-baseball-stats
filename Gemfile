source 'https://rubygems.org'
ruby '2.3.4'

gem 'rails', '4.2.9'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
# gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
gem 'json', '~> 1.8', '>= 1.8.3'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
gem 'annotate', git: 'https://github.com/ctran/annotate_models.git', require: false

group :development, :test do
  gem 'byebug'
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'capybara'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner'
  gem 'faker'
  gem 'simplecov', :require => false
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
