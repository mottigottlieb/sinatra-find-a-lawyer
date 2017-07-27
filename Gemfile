source 'http://rubygems.org'
 
gem 'sinatra'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all' 
gem 'pg'
gem 'thin'
gem 'shotgun'
gem 'nokogiri'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem 'rack-flash3'


group :development do
 gem 'sqlite3'
 gem "tux"
end

#This will allow us to use Postgres on Heroku
group :production do
 gem 'pg'
end

# For the testing suite
group :test do 
  gem 'sqlite3'
  gem "tux"
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end