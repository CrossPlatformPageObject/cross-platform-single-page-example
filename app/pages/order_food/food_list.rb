class FoodList < Page
	def initialize
		@id        = PageId.new({
			                        web:   "",
			                        ios:   "* title:'Food'",
			                        droid: ""
		                        })
		@food_item = Field.transition_element({
			                                      web:   "",
			                                      droid: "* {text CONTAINS '%s'}",
			                                      ios:   ""
		                                      },
		                                      {
																						to: FoodItemDetail
		                                      })

		super('food list page')
	end

	def order_items(order_items)
		order_items.each do |item|
			@food_item.click item.item_name
			App.food_item_detail_page.add_to_cart
		end
	end

end

PageRegistry.register_page(FoodList)
