source 'http://rubygems.org'
 
ruby '2.3.1'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem "sinatra-contrib", require: false # This is for Hot Reloading
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'nokogiri'
gem 'shotgun'
gem 'pry'
gem 'bcrypt', '~> 3.1.7' # on windows check readme for instrucitons
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