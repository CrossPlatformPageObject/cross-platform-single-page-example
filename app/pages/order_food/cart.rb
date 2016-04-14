class Cart < Page
	def initialize
		@id = PageId.new({
			                 web:   { text: 'Your Purchased Items:' },
			                 ios:   "",
			                 droid: "* {text CONTAINS 'Cart Items'}"
		                 })

		@item = Field.element({
			                      droid: "* id:'text1'",
			                      ios:   "",
			                      web:   { class: 'item_name' }
		                      })
		super('cart')
	end

	def get_items
		@item.text
	end
end

PageRegistry.register_page(Cart)
