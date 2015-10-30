class OrderItem
	attr_reader :item_name, :quantity

	def initialize(item_name, quantity)
		@item_name = item_name
		@quantity  = quantity
	end
end