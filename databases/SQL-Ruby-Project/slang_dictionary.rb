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
    type INT,
    country INT,
    is_it_in BOOLEAN,
    example VARCHAR(255),
    update_request INT,
    FOREIGN KEY(type) REFERENCES type(id),
    FOREIGN KEY(country) REFERENCES country(id),
    FOREIGN KEY(update_request) REFERENCES update_request(id)
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
 slang_db.execute("INSERT INTO country (name_country) VALUES ("USA")")
 slang_db.execute("SELECT * FROM country")
