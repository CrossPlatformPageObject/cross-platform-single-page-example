class Driver
	include Cucumber::RbSupport::RbWorld

	@@DRIVER         = nil
	DRIVER_KEY       = :web
	XPATH_IDENTIFIER = '//'

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
		return if locator.empty?
		B.element(get_selector(locator) => locator).wait_until_present
		B.element(get_selector(locator) => locator).click
	end

	def exists?(id_map, wait=true)
		locator = id_map[driver_key]
		return false if locator.blank?
		begin
			locator = "(#{locator})"
			B.element(locator).wait_until_present if wait
			B.element(locator).present?
		rescue TimeoutError, Selenium::WebDriver::Error::UnhandledAlertError
			p "exists error #{locator}"
			false
		end
	end

	def back
		B.back
	end

	private
	def get_selector(locator)
		(locator.start_with? XPATH_IDENTIFIER) ? :xpath : :css
	end

end
