# frozen_string_literal: true

source "https://rubygems.org"

ruby '2.4.1'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'rack'
gem 'rake'
gem 'rubocop'
gem 'sinatra'
gem 'sinatra-flash'


group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
