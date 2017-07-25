ENV['RACK_ENV'] ||= "development" # default is development

# get the bundler tasks for the given environment
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# Set up development database (Sqlite3)
configure :development do
 set :database, 'sqlite3:db/dev.db'
 set :show_exceptions, true
 ActiveRecord::Base.logger = Logger.new(STDOUT)  
end
# Set up test database (Sqlite3)
configure :test do
 set :database, 'sqlite3:db/test.db'
 set :show_exceptions, true
 ActiveRecord::Base.logger = Logger.new(STDOUT)
end
# Set up production database (Heroku postgres) Code pulled from: http://mherman.org/blog/2013/06/08/designing-with-class-sinatra-plus-postgresql-plus-heroku/#.WTN6ZGjysuW
configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end

# require all the app files
require_all 'app'