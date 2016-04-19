class Driver
	include Cucumber::RbSupport::RbWorld

	@@DRIVER         = nil
	DRIVER_KEY       ||= :web
	XPATH_IDENTIFIER ||= '//'

	def self.platform
		Platform::WEB
	end

	def self.get_driver
		@@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
	end

	def driver_key
		DRIVER_KEY
	end

	def click(id_map)
		locator = id_map[DRIVER_KEY]
		return if locator.nil?
		B.element(locator).wait_until_present
		B.element(locator).click if B.element(locator).present?
	end

	def exists?(id_map, wait=true)
		locator = id_map[driver_key]
		return false if locator.blank?
		begin
			B.element(locator).wait_until_present if wait
			B.element(locator).present?
		rescue TimeoutError, Selenium::WebDriver::Error::UnhandledAlertError
			p "exists error #{locator}"
			false
		end
	end

	def text(id_map)
		locator = id_map[driver_key]
		B.elements(locator).map &:text if B.element(locator).present?
	end

	def back
		B.back
		sleep(3)
	end

	def enter_text(value, id_map)
		locator = id_map[driver_key]
		B.element(locator).send_keys value
	end

	def select_radio_button_by_value(id_map)
		locator = id_map[driver_key]
		B.element(locator).click if B.element(locator).present?
	end

	private
	def get_selector(locator)
		(locator.start_with? XPATH_IDENTIFIER) ? :xpath : :css
	end

end
