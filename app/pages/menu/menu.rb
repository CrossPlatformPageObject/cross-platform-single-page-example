class Menu < Page

	FOOD_ITEMS = 'Food Items'
	CART_ITEM  = 'Cart'

	def initialize
		@id = PageId.new({
			                 :web   => { text: 'Food Items' },
			                 :ios   => "tabBarButtonLabel marked:'Book'",
			                 :droid => "* contentDescription:'Open navigation drawer'"
		                 })

		@navigation_menu           = Field.transition_element({ droid: "* contentDescription:'Open navigation drawer'" }, { default: self })
		@navigation_secondary_menu = Field.transition_element({ ios: "* marked:'More'" }, { default: self })

		@menu_items = {
			FOOD_ITEMS => MenuItem.new(FOOD_ITEMS, FoodList),
			CART_ITEM  => MenuItem.new(CART_ITEM, Cart)
		}

		super('Menu')
	end

	def show
		@navigation_menu.click
	end

	def show_secondary
		@navigation_secondary_menu.click
	end

	def launch(item_name)
		show
		menu_item = @menu_items[item_name]
		show_secondary if menu_item.is_secondary?
		menu_item.click
	end

end

PageRegistry.register_page(Menu)

