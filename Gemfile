source "https://rubygems.org"

ruby "3.3.0"


gem "rails", "~> 7.1.4"

gem "sprockets-rails"

gem "sqlite3", ">= 1.4"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "redis", ">= 4.0.1"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

# Testing
gem 'rswag', '~> 2.13'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  # Testing
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'faker', '~> 3.2', '>= 3.2.3'
  gem 'rspec-rails', '~> 6.1'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
