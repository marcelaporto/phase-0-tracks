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

# POPULATE DATABASE (initial, to test and have some data to work with)

 # slang_db.execute("INSERT INTO country (name_country) VALUES ('USA')")
 # slang_db.execute("INSERT INTO country (name_country) VALUES ('BR')")
 # slang_db.execute("INSERT INTO country (name_country) VALUES ('UK')")
 # slang_db.execute("INSERT INTO country (name_country) VALUES ('MX')")
 # slang_db.execute("INSERT INTO country (name_country) VALUES ('CANADA')")

 # slang_db.execute("INSERT INTO type (type) VALUES ('acronym')")
 # slang_db.execute("INSERT INTO type (type) VALUES ('country')")
 # slang_db.execute("INSERT INTO type (type) VALUES ('urban')")
 # slang_db.execute("INSERT INTO type (type) VALUES ('LGBT')")
 # slang_db.execute("INSERT INTO type (type) VALUES ('common')")

 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('OMG', 'Oh my gosh - used for surprise, shock, disgust', 1, 1, 'false', 'OMG, I cant believe he did that!')")
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Lit', ' Exciting, as well as a broader meaning along the lines of excellent', 4, 1, 'true', 'The party yesterday was lit')")
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Hella', 'Hell-of: really, a lot, etc', 3, 1, 'true', 'The horror film we saw was hella scaring')")
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('WTF', 'What the f*ck - used for interjection or retoric question; shows disapproval', 1, 1, 'false', 'He was a jerk to me and I thought, WTF??')")
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Flop', 'A planned event does not happen. Can also be used as a verb', 5, 1, 'true', 'Last night was flop. I was supposed to go to a party with my friends, but they flopped on me.')")
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('FOMO', 'Fear Of Missing Out', 1, 1, 'false', 'She did not want to go to the party, but she got FOMO')") 
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Top', 'When something is really great, in a douchey way', 3, 2, 'true', 'As meninas da balada estavam top na pista')") 
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Miga', 'Short for friend; used with women and gay men', 4, 2, 'true', 'Miga você não sabe o que acabou de acontecer comigo')") 

get '/' do 
	@images = ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg"]	
	@slangs = slang_db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example, update_request.date_r FROM slang_dict LEFT OUTER JOIN country ON slang_dict.country_id = country.id LEFT OUTER JOIN type ON slang_dict.type_id = type.id LEFT OUTER JOIN update_request ON slang_dict.update_request_time = update_request.date_r")
	erb :home
end

