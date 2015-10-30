
Given(/^As a user I order following items:$/) do |table_data|
	order = []
	table_data.hashes.each {|order_data| order.push(OrderItem.new(order_data[:item_name], order_data[:quantity]))}
	App.food_list_page.order_items order
end