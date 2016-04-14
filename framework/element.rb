require_relative 'elements/transitional'

class Element

	def initialize(id_map)
		@id_map = id_map
		@driver = Driver.get_driver
	end

	def exists?(wait=40, *args)
		@driver.exists?(interpolate_locators_with_params(*args))
	end

	def text(*args)
		@driver.text(interpolate_locators_with_params(*args))
	end

	def await(*args)
		@driver.await(interpolate_locators_with_params(*args))
	end

	def click(*locator_params)
		@driver.click(interpolate_locators_with_params(*locator_params))
	end

	def touch(*locator_params)
		@driver.touch_screen(interpolate_locators_with_params(*locator_params))
	end

	protected
	def interpolate_locators_with_params(*values)
		expanded_locators = {}
	values            = values.flatten
		@id_map.each do |k, locator|
			temp_locator         = locator.clone
			temp_locator         = temp_locator % values if locator.is_a?(String)
			temp_locator         = temp_locator.each { |k, v| temp_locator[k] = v % values } if temp_locator.is_a?(Hash)
			expanded_locators[k] = temp_locator
		end
		expanded_locators
	end

end
