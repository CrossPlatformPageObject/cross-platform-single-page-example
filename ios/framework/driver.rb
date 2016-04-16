require 'calabash-cucumber/operations'
require_relative '../interaction_helper'

class Driver
	include Calabash::Cucumber::Operations
	include Cucumber::RbSupport::RbWorld
	include InteractionHelper

	@@DRIVER = nil
	PLATFORM ||= :ios

	def self.platform
		Platform::IOS
	end

	def self.get_driver
		@@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
	end

	def driver_key
		PLATFORM
	end

	def click(id_map)
		locator = id_map[driver_key]
		return if locator.nil?
		binding.pry
		touch_element locator
	end

	def exists?(id_map, wait=true)
		begin
			locator = id_map[PLATFORM]
			return false if locator.nil?
			opts.merge!(:screenshot_on_error => false)
			wait_for_elements_exist([locator], opts)
			element_exists locator
		rescue WaitError
			false
		end
	end

	def back
		press_back_button
		sleep(0.3)
	end

	def text

	end
end
