ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Loads up a Pry Console with the env"
task :console do
    Pry.start
end