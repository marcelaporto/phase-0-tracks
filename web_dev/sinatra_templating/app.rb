# require gems
require 'sinatra'
require 'sqlite3'
require "sinatra/reloader" if development?

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students") ## if we want this varibale to be available in the template, you have to use an @ sign
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/' ## gets you back to the homepage
end


# OURS

get '/students/:search' do
campus = ["SF", "SD", "NYC", "CHI", "SEA"]
if campus.include? params[:search] 
	@students_by_campus = db.execute("SELECT * FROM students WHERE campus=?", params[:search]) ## if we want this varibale to be available in the template, you have to use an @ sign
	erb :students_campus
else
	@students_by_name = db.execute("SELECT * FROM students WHERE name=?", params[:search]) ## if we want this varibale to be available in the template, you have to use an @ sign
	erb :students_name
end
end


get '/update' do
  erb :update_age
end

# create new students via
# a form
post '/update/age' do
  db.execute("UPDATE students SET age=? WHERE name=?", [params['new_age'].to_i, params['name_search']])
  redirect '/' ## gets you back to the homepage
end
