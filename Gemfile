source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7.1'
gem 'react-rails', '~> 1.10.0'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# JSON
gem "oj", "~> 2.18"
gem "json-schema", "~> 2.8"
gem "activerecord_json_validator", "~> 1.2"
gem "jsonapi-resources", "~> 0.8"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem "rspec", "~> 3.5"
  gem "rspec-rails", "~> 3.5"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :test do
  gem "capybara", "~> 2.12"
  gem "capybara-webkit", "~> 1.12"
  gem "capybara-screenshot", "~> 1.0", require: false
  gem "capybara_objects", "~> 0.1.1"
  gem "database_cleaner", "~> 1.5"
  gem "selenium-webdriver", "~> 3.2"
  gem "chromedriver-helper", ">= 0.0.8"
  gem "factory_girl_rails", "~> 4.7"
  gem "factory_girl", "~> 4.7"
  gem "rspec-collection_matchers", "~> 1.1.3"
  gem "shoulda"
  gem "shoulda-matchers", "~> 3.1"
  gem "webmock", "~> 2.3"

  gem "json-schema-rspec"
  gem "poltergeist", "~> 1.13"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

