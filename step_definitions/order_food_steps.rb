Given(/^As a user I order following items:$/) do |table_data|
	@order = []
	table_data.hashes.each { |order_data| @order.push(OrderItem.new(order_data[:item_name], order_data[:quantity].to_i)) }
	expect(App.current_page).to be_a_kind_of(FoodList)
	App.food_list_page.order_items @order
end

Then(/^I should see above items in cart$/) do
	App.menu_page.launch Menu::CART_ITEM
	expect(App.current_page).to be_a_kind_of(Cart)
	# cart_items = App.cart_page.get_items
	# expect(cart_items.count).to eq(@order.count)
end

When(/^I proceed to purchase items$/) do
	App.cart_page.proceed_to_purchase
end

And(/^I enter following user details$/) do |user_table|
	user_data = user_table.hashes.first
	App.user_details_page.submit_user_details(user_data['name'], user_data['address'])
end

And(/^I choose to pay by cash after delivery$/) do
	App.payment_preference_page.pay_by_cash_and_proceed
end

Then(/^I see the complete purchase summary$/) do
	expect(App.current_page).to be_a_kind_of(PurchaseSummary)
end

And(/^I choose to pay by card$/) do
	App.payment_preference_page.select_credit_card_and_proceed
	App.credit_card_page.enter_credit_card_details
end