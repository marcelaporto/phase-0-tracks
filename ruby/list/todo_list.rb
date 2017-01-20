class TodoList
	attr_accessor :items

	def initialize (items)
		@items = items
		
	end

	def get_items
	 p @items 
	end

	def add_item(item)
		items << item
	end

	def delete_item(item)
		items.delete(item)
	end

	def get_item(index)
		items.fetch(index)
	end

end