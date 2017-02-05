# Slang Dictionary and Database


# Require gem
require 'sqlite3'
require 'faker'

# Create Database
slang_db = SQLite3::Database.new('slang_dict.db')
slang_db.results_as_hash = true

# Create commands to create tables inside the database
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
    update_request_id INT,
    FOREIGN KEY(type_id) REFERENCES type(id),
    FOREIGN KEY(country_id) REFERENCES country(id),
    FOREIGN KEY(update_request_id) REFERENCES update_request(id)
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


# Execute commands and create tables

slang_db.execute(create_slang_table_cmd)
slang_db.execute(create_update_table_cmd)
slang_db.execute(create_country_cmd)
slang_db.execute(create_type_cmd)

# Test it out

# Populate Database
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
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('FOMO', 'Oh my gosh - used for surprise, shock, disgust', 1, 1, 'false', 'She did not want to go to the party, but she got FOMO')") 
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Top', 'When something is really great, in a douchey way', 3, 2, 'true', 'As meninas da balada estavam top na pista')") 
 # slang_db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('Miga', 'Short for friend; used with women and gay men', 4, 2, 'true', 'Miga você não sabe o que acabou de acontecer comigo')") 
  
 slang_db.execute("INSERT INTO update_request (name, request, date) VALUES (Faker::Name.name, 'I would like to change the example of FOMO because' + Faker::Friends.quote ,Faker::Date.between(100.days.ago, Date.today))") 

# Insert methods to view and edit database
print slang_db.execute("SELECT * FROM slang_dict")

# def view_all (db, slang)
# 	slangs = db.execute("SELECT * FROM slang_dict")
# # slangs.each do |slang_i|
# #  puts "#{slang_i['slang']}:\n Meaning: #{slang_i[meaning]}"
# # end

# end