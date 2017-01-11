#Release 0

def hello_world
puts "Before block"
yield("Marcela")
yield("Emilie")
puts "After block"
end 

puts hello_world { |x| puts "This is #{x}"}

#Release 1


seasons = ["summer", "fall", "winter", "spring"]

puts nil
p seasons 

puts seasons.map! {|seasons| seasons.upcase }

puts nil
p seasons

seasons.each do |season|
seasons.delete_at(2)
puts "My favorite season is #{season}"
end 

puts nil
p seasons

weather = {
"fall" => "rainy", 
"summer" => "sunny",
"winter" => "snowy",
"spring" => "windy"
}

puts nil
p weather

weather.each do |key, weather|
puts "The weather outside is #{weather}"
end

puts nil
p weather

test = []

weather.map do |key, weather|
     puts "In the #{key} it is #{weather}"
     test << key.upcase
end

puts nil
p weather
puts nil
p test

# Release 2
#We performed all 4 instructions on our test_array and 1 on our test_hash

test_array = [0,1,2,3,4,5,6,7]

test_hash = {0 => "a", 1 => "b", 4 => "c", 5 => "e"} 

#Array
test_array.delete_at(4)
puts nil
p test_array


puts test_array.take(3)
puts nil
p test_array

puts test_array.select { |a| a > 3 }
puts nil
p test_array

puts test_array.delete_if { |a| a.even? }
puts nil
p test_array

#Hash
puts test_hash.select {|key,value| value > "a" } 
puts nil
p test_hash







