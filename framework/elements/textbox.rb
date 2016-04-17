class Textbox < Element
	def initialize(id_map)
		super(id_map)
	end

	def enter_text(value, *locator_params)
		@driver.enter_text(value, interpolate_locators_with_params(*locator_params))
	end
end