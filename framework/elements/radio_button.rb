class RadioButton < Element
	def initialize(id_map)
		super(id_map)
	end

	def select(*locator_params)
		@driver.select_radio_button_by_value(interpolate_locators_with_params(*locator_params))
	end
end