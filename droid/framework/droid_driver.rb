require 'calabash-android/operations'

class Driver
	include Calabash::Android::Operations
	@@DRIVER = nil
	PLATFORM = :droid

	def self.platform
		Platform::ANDROID
	end

	def self.get_driver
		@@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
	end

	def driver_key
		PLATFORM
	end
end
