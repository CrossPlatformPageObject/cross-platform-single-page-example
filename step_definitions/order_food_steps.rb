require_relative '../app/pages/order_food/food_list'

Given(/^As a user I order following items:$/) do |table|
	order_items = table.hashes.first
	food_list_page = FoodList.new
end