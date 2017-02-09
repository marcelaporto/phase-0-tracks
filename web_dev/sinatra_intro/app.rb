# require gems
require "sinatra"
require "sinatra/reloader" if development?
require 'sqlite3'
require 'faker'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end


# write a GET route with
# route parameters
get '/about/:person' do ## route with a piece of data we are going to access (it is not a param per se)
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that retrives
# a particular address
get '/students/:id/address' do
  address = Faker::Address.street_address
  "#{address}"
end

# A /great_job route that can take a person's name as a query parameter and 
# says "Good job, [person's name]!". If the query parameter is not present, the route simply says "Good job!"
get '/great_job/' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

# A route that uses route parameters to add two numbers and respond with the result. 
# The data types are tricky here -- when will the data need to be (or arrive as) a string?

get '/:numb1/sum/:numb2' do
  number1 = params[:numb1].to_i
  number2 = params[:numb2].to_i
  result =  number1 + number2
  result.to_s
end

get '/students/search/:campus' do
  students = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end