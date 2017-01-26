# PSEUDOCODE

# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
#   set default quantity
# 	SPLIT the string 
# 	iterate through new array EACH
# 		insert in new HASH with items as KEY and default quantity as VALUE
# output: HASH 


def create_list(items)
	new_list = { }
	qnty = 1
	items.split(" ").each do |item|
		new_list[item] = qnty
	end
	new_list
end

# Method to remove an item from the list
# input: list, item name
# steps: call built-in method #DELETE(<item name>) in list 
# output: deleted value

def delete_item!(list, item)
	list.delete(item)
end

# Method to update the quantity of an item
# input: list, item, new quantity
# steps: insert item as KEY and new quantity as VALUE in list HASH, since key is unique it will rewrite the value
# output: list HASH

def add_or_update_item!(list,item,new_qnty=1)
	list[item] = new_qnty
end

# Method to print a list and make it look pretty
# input: list 
# steps: iterate through hash list with EACH and print out line
# output: strings

def print_list(list)
	print "\n\nYou need:\n"
	list.each do |item, qnty|
		print "#{qnty} #{item}(s)\n"
	end
end


# DRIVER CODE

new_list = create_list("carrots doughnuts nuts")
puts new_list
add_or_update_item!(new_list, "pizza")
add_or_update_item!(new_list, "sourdhough", 3)
puts new_list
delete_item!(new_list, "nuts")
puts new_list
add_or_update_item!(new_list, "carrots", 6 )
puts new_list
print_list(new_list)
