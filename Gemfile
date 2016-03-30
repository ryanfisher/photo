source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim-rails'
gem 'jquery-ui-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# https://github.com/modeset/teaspoon/issues/443
gem 'sprockets', '3.2.0'
gem 'sprockets-rails', '2.3.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'

# gem 'aws-s3'
gem 'mini_magick'
gem 'fog'
gem 'sidekiq'

gem 'attr_encrypted', '~> 1.3.5'

gem 'skylight', '~> 0.10.1'
gem 'rollbar', '~> 2.5.0'

gem 'passenger'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'reek'

# Use Capistrano for deployment
group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-passenger'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

gem 'actionpack-action_caching'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.4.0'

  gem 'rspec-rails', '~> 3.0'
  gem 'rspec_junit_formatter', '0.2.2'

  gem 'guard-rspec'

  gem 'teaspoon-jasmine'
  gem 'guard-teaspoon'

  gem 'coveralls', require: false
end

group :test do
  gem 'simplecov', require: false
end
