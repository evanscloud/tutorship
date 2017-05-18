# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.20'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', github: 'rails/sass-rails'

# Semantic UI assets
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'autoprefixer-rails', '~> 7.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Authentication
gem 'devise', '~> 4.3'
gem 'omniauth', '~> 1.6'
gem 'omniauth-github', '~> 1.2'

# GitHub API
gem 'octokit', '~> 4.7'

group :development, :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.14'
  gem 'selenium-webdriver', '~> 3.4'
  # Add RSpec
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  # We are pulling from Github only because we need PR #888
  # See: https://github.com/stympy/faker/pull/888
  # TODO: change this when a new version of faker released
  gem 'faker', '~> 1.7.3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
  # Access an IRB console on exception pages or by using <%= console %> anywhere
  # in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0'
  # Use Capistrano for deployment
  # gem 'capistrano-rails'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'simplecov', '~> 0.14.1', require: false
  gem 'codeclimate-test-reporter', '~> 1.0.7', require: false
end
