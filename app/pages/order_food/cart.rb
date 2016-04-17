class Cart < Page
	def initialize
		@id = PageId.new({
			                 web:   { text: 'Your Purchased Items:' },
			                 ios:   "",
			                 droid: "* {text CONTAINS 'Cart Items'}"
		                 })

		@item = Field.element({
			                      droid: "* id:'tvFoodName'",
			                      ios:   "",
			                      web:   { class: 'item_name' }
		                      })

		@proceed = Field.transition_element({
			                                    droid: "* id:'btnCheckout'",
			                                    ios:   '',
			                                    web:   {id: 'checkout'}
		                                    }, {
			                                    to: UserDetails
		                                    })
		super('cart')
	end

	def get_items
		@item.text
	end

	def proceed_to_purchase
		@proceed.click
	end
end

PageRegistry.register_page(Cart)
