require_relative 'elements/transitional'

class Element
	include Transitional

	def initialize(id_map)
		@id_map = id_map
		@driver = Driver.get_driver
	end

	def exists?(wait=40, *args)
		@driver.exists?(interpolate_locators_with_params(*args), wait)
	end

	def does_not_exist?(wait=40, *args)
		@driver.does_not_exist?(interpolate_locators_with_params(*args), wait)
	end

	def execute_js(*args)
		@driver.execute_js(interpolate_locators_with_params(*args))
	end

	def wait_while_present opts
		@driver.wait_while_present(@id_map, opts)
	end

	def execute_js_on_webview(*args)
		@driver.execute_js_on_webview interpolate_locators_with_params(*args)
	end

	def css_class(*args)
		@driver.css_class(interpolate_locators_with_params(*args))
	end

	def text(*args)
		scroll_to(*args)
		@driver.text(interpolate_locators_with_params(*args))
	end

	def text_last(*args)
		scroll_to(*args)
		@driver.text_last(interpolate_locators_with_params(*args))
	end

	def await(*args)
		@driver.await(interpolate_locators_with_params(*args))
	end

	def wait_for_text_change
		current_text = text
		sleep 0.5 while (current_text == text)
	end

	def wait_for_text_change
		current_text = text
		sleep 0.5 while (current_text == text)
	end

	def wait_to_have_text(desired_text)
		Timeout::timeout(10) do
			while text != desired_text
				sleep 1
			end
		end
	end

	def web_view_text(*args)
		@driver.web_view_text(interpolate_locators_with_params(*args))
	end

	def click(*locator_params)
		@driver.click(interpolate_locators_with_params(*locator_params))
	end

	def scroll_to(*locator_params)
		@driver.go_till_element(interpolate_locators_with_params(*locator_params))
	end

	def scroll_up
		@driver.scroll_top(@id_map)
	end

	def scroll(direction)
		@driver.scroll_element(@id_map, direction)
	end

	def scroll_view(direction)
		@driver.scroll_view(direction)
	end

	def execute_query(*args)
		@driver.execute_query(@id_map, *args)
	end

	def selected?(*locator_params)
		@driver.selected?(interpolate_locators_with_params(*locator_params))
	end

	def touch(*locator_params)
		@driver.touch_screen(interpolate_locators_with_params(*locator_params))
	end

	def get_matching_text(*locator_params)
		@driver.get_all_matching_text(interpolate_locators_with_params(*locator_params))
	end

	def is_visible?
		@driver.alert_exists?(@id_map)
	end

	protected
	def interpolate_locators_with_params(*values)
		expanded_locators = {}
		values = values.flatten
		@id_map.each do |k, v|
			v.is_a?(Hash) ? locator = v[ENV['APP_VARIANT'].to_sym] : locator = v
			expanded_locators[k] = locator % values if (locator.is_a?(String) and k.eql? @driver.driver_key)
		end
		expanded_locators
	end
end
