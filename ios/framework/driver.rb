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
		touch_element locator
	end

	def exists?(id_map)
		begin
			locator = id_map[PLATFORM]
			return false if locator.nil?
			# opts.merge!(:screenshot_on_error => false)
			wait_for_elements_exist([locator])
			element_exists locator
		rescue WaitError
			false
		end
	end

	def back
	end

	def text

	end

	def enter_text(input, id_map)
		locator = id_map[driver_key]
		touch_element(locator)
		wait_for_keyboard
		keyboard_enter_text(input)
	end

	def select_radio_button_by_value(id_map)
		locator = id_map[driver_key]
		touch_element locator
	end

end
