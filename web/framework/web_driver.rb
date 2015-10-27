class Driver
	include Cucumber::RbSupport::RbWorld

	@@DRIVER         = nil
	DRIVER_KEY       = :web

	def self.platform
		Platform::WEB
	end

	def self.get_driver
		@@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
	end

	def driver_key
		DRIVER_KEY
	end

end
