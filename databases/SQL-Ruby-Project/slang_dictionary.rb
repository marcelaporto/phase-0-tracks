# Slang Dictionary and Database


# REQUIRE GEM
require 'sqlite3'
require 'faker'

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


# EXECUTE COMMANDS AND CREATE TABLES

slang_db.execute(create_slang_table_cmd)
slang_db.execute(create_update_table_cmd)
slang_db.execute(create_country_cmd)
slang_db.execute(create_type_cmd)

# POPULATE DATABASE

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
   

# METHODS TO VIEW AND EDIT DATABASE 

# Shows all the slangs in the database
# Input: Database
# Steps: 
# Executes SQLite3 to create nested Array (in each index there is a hash, in which there are the specifications of each slang)
# Sort array by alphabetical order of the slang
# Iterate through the array to print out Slangs and its specifications in a user friendly matter
# Output: Strings
def view_all (db)
	slangs = db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example FROM slang_dict JOIN country ON slang_dict.country_id = country.id JOIN type ON slang_dict.type_id = type.id")
	slangs.sort_by! { |each_slang| each_slang['slang'].downcase } # Sort by alphabetical order
	
	slangs.each do |slang_i|
	  print "#{slang_i['slang']}\n\n Meaning: #{slang_i['meaning']}\n Type:#{slang_i['type']} \n Country: #{slang_i['name_country']} \n Are people using it now? #{slang_i['is_it_in']}\n Example: #{slang_i['example']} \n\n\n "
	end

end

# view_all(slang_db)

# Adds new slang to database
def add_new(db)
	new_slang = [ ]
	get_data(db, new_slang)
	check_and_add(db, new_slang)
end 

# Gets the data from the user
def get_data(db, new_slang)
	print "\n New Slang: "
	slang = gets.chomp
	new_slang << slang
	print "\n Meaning: "
	meaning = gets.chomp
	new_slang << meaning
	print "\n Type of Slang (1 = Acronym; 2 = Country; 3 = Urban; 4 = LGBTQ; 5 = Common): "
	type_id = gets.chomp
	new_slang << type_id

	print "\n Country(by number):\n"
	countries = db.execute("SELECT * FROM country")
	countries.each do |country|
		puts "#{country['id']} | #{country['name_country']}"
	end
	country = gets.chomp
	new_slang << country

	print "\n Are people still using it? (true or false): "
	is_it_in = gets.chomp
	new_slang << is_it_in
	print"\n Please give us an example on how to use the word: "
	example = gets.chomp
	new_slang << example

	new_slang[0].capitalize!
	return new_slang

end

#Checks if slang already exists in the database
def check_and_add (db, new_slang)
	slangs = db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example FROM slang_dict JOIN country ON slang_dict.country_id = country.id JOIN type ON slang_dict.type_id = type.id")
	if slangs.any? {|array_of_hashes| array_of_hashes['slang'] == new_slang[0]}
		print "I'm sorry, this is already in our dictionary! Do you maybe want to request an update?(Yes/No)\n"
		answer = gets.chomp
		if answer == "Yes"
			# update_word(db)
			print "OK!"
		end
	else 
		db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('#{new_slang[0]}', '#{new_slang[1]}', #{new_slang[2]}, '#{new_slang[3]}', '#{new_slang[4]}', '#{new_slang[5]}')") # not the best way - how to add a placeholder for the table and convert country name into ID????
		print "New slang" 
	end
end


# Request Update
def update_word(db)
print "Hello! You are about to request an update on one of our entries, please feel free to "
time = Time.new
update_request = gets.chomp
db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('#{new_slang[0]}', '#{new_slang[1]}', #{new_slang[2]}, '#{new_slang[3]}', '#{new_slang[4]}', '#{new_slang[5]}')") # not the best way - how to add a placeholder for the table and convert country name into ID????

end

# View by Condition
# def view_condition(db, condition)
# end


def home_message
options = {1 => "See all the slangs", 2 => "Pick slang by condition", 3 => "Search for slang", 4 => "Update slang", 5 => "Add new slang",6 => "Exit"}
print "Hello and welcome to the slang dictionary! \n
What would you like to do today? Please insert the number relative to the option:\n"
options.each do |key, value|
	puts "#{key} | #{value}"
end
print "\n"
end


#  DRIVER CODE

# Initial message, and place to go back when it ends


until answer == 6 

home_message
answer = gets.chomp

case answer
	when 1
		view_all(slang_db)
	# when 2
	# 	print "What is your condition? Please write only the condition (eg: if I just want slangs that people are using, I'll write true) \n"
	# 	condition = gets.chomp
	# 	view_condition(slang_db, condition)
	# when 3
	# 	print "What slang do you want to find?\n"
	# 	search = gets.chomp
	# 	search(slang_db, search)
	# when 4
	# 	update_word(slang_db)
	when 5
		add_new(slang_db)
	else 
		print "Want to try again maybe?\n"
end

end