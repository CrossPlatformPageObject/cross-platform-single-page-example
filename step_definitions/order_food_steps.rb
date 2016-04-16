Given(/^As a user I order following items:$/) do |table_data|
	@order = []
	table_data.hashes.each { |order_data| @order.push(OrderItem.new(order_data[:item_name], order_data[:quantity].to_i)) }
	expect(App.current_page).to be_a_kind_of(FoodList)
	App.food_list_page.order_items @order
end

Then(/^I should see above items in cart$/) do
	App.menu_page.launch Menu::CART_ITEM
	expect(App.current_page).to be_a_kind_of(Cart)

	cart_items = App.cart_page.get_items
	# expect(cart_items.count).to eq(@order.count)
end

When(/^I proceed to purchase items$/) do
	pending
end

And(/^I enter following user details$/) do |table|
	# table is a table.hashes.keys # => [:name, :address]
	pending
end

And(/^I choose to pay by cash after delivery$/) do
	pending
end

Then(/^I see the complete purchase summary$/) do
	pending
end