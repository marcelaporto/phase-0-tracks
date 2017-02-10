# PUBLIC SLANG DATABASE

# require gems
require 'sinatra'
require 'sqlite3'
require "sinatra/reloader" if development?

# set
set :public_folder, File.dirname(__FILE__) + '/static' # sets where the static files will be
# set :port, 8080 # sets the port of the server
set :views, "views"

# CREATE DATABASE
slang_db = SQLite3::Database.new('slang_dict.db')
slang_db.results_as_hash = true

# GENERATE COMMANDS TO CREATE TABLES 
# Three foreign keys: country, type, update_request
create_slang_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS slang_dict( 
    id INTEGER PRIMARY KEY,
    slang VARCHAR(255),
    meaning INT,
    type_id INT,
    country_id INT,
    is_it_in BOOLEAN,
    example VARCHAR(255),
    update_request_time BLOB,
    FOREIGN KEY(type_id) REFERENCES type(id),
    FOREIGN KEY(country_id) REFERENCES country(id),
    FOREIGN KEY(update_request_time) REFERENCES update_request(date_r)
  )
SQL

create_update_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS update_request(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    request VARCHAR(255),
    date_r BLOB
  )
SQL

create_country_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS country(
    id INTEGER PRIMARY KEY,
    name_country VARCHAR(255)
    )
SQL

create_type_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS type(
    id INTEGER PRIMARY KEY,
    type VARCHAR(255)
  )
SQL


# EXECUTE COMMANDS AND CREATE TABLES

slang_db.execute(create_slang_table_cmd)
slang_db.execute(create_update_table_cmd)
slang_db.execute(create_country_cmd)
slang_db.execute(create_type_cmd)

# POPULATE DATABASE

get '/' do 
	@images = ["/cartoons/img1.jpg", "/cartoons/img2.jpg", "/cartoons/img3.jpg", "/cartoons/img4.jpg"]	
	@slangs = slang_db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example, update_request.date_r FROM slang_dict LEFT OUTER JOIN country ON slang_dict.country_id = country.id LEFT OUTER JOIN type ON slang_dict.type_id = type.id LEFT OUTER JOIN update_request ON slang_dict.update_request_time = update_request.date_r")
	erb :home
end

get '/all' do
	@slangs = slang_db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example, update_request.date_r FROM slang_dict LEFT OUTER JOIN country ON slang_dict.country_id = country.id LEFT OUTER JOIN type ON slang_dict.type_id = type.id LEFT OUTER JOIN update_request ON slang_dict.update_request_time = update_request.date_r")
	@slangs.sort_by! { |each_slang| each_slang['slang'].downcase } # Sort by alphabetical order
	erb :all
end

