# PUBLIC SLANG DATABASE

# require gems
require 'sinatra'
require 'sqlite3'
require "sinatra/reloader" if development?

# set
set :public_folder, File.dirname(__FILE__) + '/static' # sets where the static files will be
# set :port, 8080 # sets the port of the server
set :views, "views"