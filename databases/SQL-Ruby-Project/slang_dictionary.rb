# Slang Dictionary and Database


# REQUIRE GEM
require 'sqlite3'

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

# POPULATE DATABASE (IN THE END OF THE FILE)

# METHODS TO VIEW AND EDIT DATABASE 

# Shows all the slangs in the database
# Input: Database 
# Steps: Executes SQLite3 to create nested Array (in each index there is a hash, in which there are the specifications of each slang)
# Sort array by alphabetical order of the slang
# Iterate through the array to print out Slangs and its specifications in a user friendly matter
# Output: Strings
def view_all (db)

	slangs = db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example, update_request.date_r FROM slang_dict LEFT OUTER JOIN country ON slang_dict.country_id = country.id LEFT OUTER JOIN type ON slang_dict.type_id = type.id LEFT OUTER JOIN update_request ON slang_dict.update_request_time = update_request.date_r")
	slangs.sort_by! { |each_slang| each_slang['slang'].downcase } # Sort by alphabetical order
	
	slangs.each do |slang_i|
	  print "\n#{slang_i['slang']}\n\n Meaning: #{slang_i['meaning']}\n Type:#{slang_i['type']} \n Country: #{slang_i['name_country']} \n Are people using it now? #{slang_i['is_it_in']}\n Example: #{slang_i['example']} \n Last update request: #{slang_i['date_r']} \n\n\n "
	end

end

# Adds new slang to database
# Input: Database; Output: String with the status
# Steps: create new_slang array, get the data fromt the user (get_data method),
# then check if it already exists in the database and add it or not (check_and_add method)
def add_new(db)
	new_slang = [ ]
	get_data(db, new_slang)
	check_and_add(db, new_slang)
end 

# Gets the data from the user
# Input: empty array and database
# Asks questions to user to get data
# Store it in an array 
# Output: Array filled with user's answers
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
		puts " #{country['id']} | #{country['name_country']}"
	end
	print "\n"
	country = gets.chomp
	new_slang << country

	print "\n Are people still using it? (true or false): "
	is_it_in = gets.chomp
	new_slang << is_it_in
	print"\n Please give us an example on how to use the word: "
	example = gets.chomp
	new_slang << example

	return new_slang
end

# Checks if slang already exists in the database
# Input: database and array filled with user's answers
# Steps: Get all the slangs in the database (just the name) - return a HASH; redefine name of the new slang to compare with existing slangs (upcase if acronym, capitalize otherwise)
# iterate through HASH, check if new slang already exists in database; if so, tell user and offer to request an update; otherwise, insert in database and tell user
# Output: string - status to the user 
def check_and_add (db, new_slang)
	slangs = db.execute("SELECT slang_dict.slang FROM slang_dict")

	if new_slang[2] == 1
		new_slang[0].upcase!
	else
		new_slang[0].capitalize!
	end

	if slangs.any? {|array_of_hashes| array_of_hashes['slang'] == new_slang[0]}
		print "\nI'm sorry, this is already in our dictionary! Do you maybe want to request an update?(Yes/No)\n"
		answer = gets.chomp
		if answer == "Yes"
			print "OK!"
			update_word(db)
		end
	else 
		db.execute("INSERT INTO slang_dict (slang, meaning, type_id, country_id, is_it_in, example) VALUES ('#{new_slang[0]}', '#{new_slang[1]}', #{new_slang[2]}, '#{new_slang[3]}', '#{new_slang[4]}', '#{new_slang[5]}')") # not the best way - how to add a placeholder for the table????
		print "New slang #{new_slang[0]} has been added to the database!" 
	end

end


# Let's user request an update in a slang
# Input: database
# Steps: get information from user, insert in request_update table, with the date and time ; update slang in slang_dict table, and add last time someone requested an update for that word
# Output: new entry in update_request table

def update_word(db)
	time = Time.new
	
	print "Hello! You are about to request an update on one of our entries. Please enter the slang you think should be updated:\n"
	slang = gets.chomp
	print "Ok then, please right down what you think should change, and we will revise it shortly:\n"
	request = gets.chomp 
	
	db.execute("INSERT INTO update_request (name, request, date_r) VALUES (?, ?, ?)", [slang, request, time.inspect.to_s]) 
	db.execute("UPDATE slang_dict SET update_request_time='#{time.inspect.to_s}' WHERE slang='#{slang}'") 
end


# View database according to a specific condition
# Inputs: database, condition
# Steps: Define in which column does the condition apply to (define_column method),
# Create array with slangs that follow that condition (each one in it's own content hash)
# Sort by alphabetical order and iterate through array to show user
# Outputs: String - database filtered according to condition
def view_condition(db, condition)

	column = define_column(db, condition)
	
	condition_db = db.execute("SELECT slang_dict.slang, slang_dict.meaning, type.type, country.name_country, slang_dict.is_it_in, slang_dict.example, update_request.date_r FROM slang_dict LEFT OUTER JOIN country ON slang_dict.country_id = country.id LEFT OUTER JOIN type ON slang_dict.type_id = type.id LEFT OUTER JOIN update_request ON slang_dict.update_request_time = update_request.date_r WHERE #{column}='#{condition}'")
	condition_db.sort_by! { |each_slang| each_slang['slang'].downcase } # Sort by alphabetical order
	
	 condition_db.each do |slang_i|
	   print "\n\n#{slang_i['slang']}\n\n Meaning: #{slang_i['meaning']}\n Type:#{slang_i['type']} \n Country: #{slang_i['name_country']} \n Are people using it now? #{slang_i['is_it_in']}\n Example: #{slang_i['example']} \n Last update request: #{slang_i['date_r']} \n\n\n "
	 end

end

# Define in which column does the user want to refine the results
# Inputs: database, condition
# Steps: generate arrays of each possible answers by category (is_it_in, type, country, slang - slang is inserted so method can be used to search slang as well)
# Case statement to define which column it is, by testing if the condition is included in what array
# Output: Column
def define_column(db, condition)

	condition_d = condition.downcase
	column = ''

	# Generate arrays to make comparison - tried to do an array_creator(db), but it won't recognize all the arrays generated inside the method.
	# And I can't do a nested each method to generate array because each data comes from a different table
	column_in =['true', 'false']

	column_countries = [ ]
	countries = db.execute ("SELECT name_country FROM country")
	countries.each do |hash|
		column_countries << hash['name_country'].downcase
	end
	
	column_type = [ ]
	types = db.execute ("SELECT type FROM type")
	types.each do |hash|
		column_type << hash['type'].downcase
	end

	column_slang = []
	slangs = db.execute("SELECT slang FROM slang_dict")
	slangs.each do |hash|
		column_slang << hash['slang'].downcase
	end

#  Do case statement with arrays and condition
	case 
	when (column_in.include? condition_d)
		column = 'slang_dict.is_it_in'
	when (column_type.include? condition_d)
		column = 'type.type'
	when (column_countries.include? condition_d)
		column = 'country.name_country'
	when (column_slang.include? condition_d)
		column = 'slang_dict.slang'
	else
		print "We couldn't understand your condition! Please try again"
		exit # Couldn't find a way to exit method and get back to home_message without starting a loophole. This is the best command I found. Any tips?
	end
	column
end

# Show update requests
def show_update_requests(db)
	slangs = db.execute("SELECT name, request, date_r FROM update_request")
	slangs.sort_by! { |each_slang| each_slang['name'].downcase } # Sort by alphabetical order
	
	slangs.each do |slang_i|
	  print "\n Slang: #{slang_i['name']}\n Request: #{slang_i['request']}\n Date:#{slang_i['date_r']}\n\n"
	end
end

# Creates initial message so user can choose what to do
# Inputs: None
# Steps: Welcomes user, shows him menu of options
# Output: String
def home_message
	options = {1 => "See all the slangs", 2 => "Pick slang by condition", 3 => "Search for slang", 4 => "Update slang", 5 => "Add new slang", 6 => "See update requests", 7 => "Exit"}
	print "\n\nThis is the slang dictionary! Hello! \nWhat would you like to do today? Please insert the number relative to the option:\n\n"
	options.each do |key, value|
		puts "#{key} | #{value}"
	end
	print "\n"
end


#  DRIVER CODE

# Initial message, and place to go back when it ends
def home_page(slang_db)
home_message
answer = gets.chomp.to_i

until answer == 7

case answer
	when 1
		view_all(slang_db)
	when 2
		print "What is your condition? Please write only the condition (eg: if I just want slangs that people are using, I'll write true) \n"
		condition = gets.chomp
		view_condition(slang_db, condition)
	when 3
		print "What slang do you want to find?\n"
		condition = gets.chomp
		view_condition(slang_db, condition)
	when 4
		update_word(slang_db)
	when 5
		add_new(slang_db)
	when 6
		show_update_requests(slang_db)
	else 
		print "Want to try again maybe?\n"
end

home_message
answer = gets.chomp.to_i

break if answer == "Exit" # Infinite loop escape route
end
end

home_page(slang_db)

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
