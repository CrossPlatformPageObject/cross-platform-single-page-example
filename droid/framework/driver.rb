require 'calabash-android/operations'
require_relative '../../droid/interaction_helper'
class Driver
	include InteractionHelper
	include Calabash::Android::Operations
	@@DRIVER = nil
	PLATFORM ||= :droid

	def self.platform
		Platform::ANDROID
	end

	def self.get_driver
		@@DRIVER = @@DRIVER.nil? ? Driver.new : @@DRIVER
	end

	def driver_key
		PLATFORM
	end

	def exists?(id_map)
		begin
			return false if id_map[driver_key].blank?
			wait_for_element_to_appear(id_map[driver_key])
			element_exists id_map[driver_key]
		rescue WaitError
			false
		end
	end

	def click(id_map)
		locator = id_map[driver_key]
		return if locator.nil?
		begin
			scroll_to locator
		rescue RuntimeError
		end
		touch_element locator
	end

	def back
		press_back_button
		sleep(0.3)
	end

	def text(id_map)
		locator = id_map[driver_key]
		query(locator, :text)
	end

	def enter_text(value, id_map)
		locator = id_map[driver_key]
		wait_for_element_to_appear(locator)
		query(locator, :setText => value)
	end

	def select_radio_button_by_value(id_map)
		locator = id_map[driver_key]
		wait_for_element_to_appear(locator)
		query(locator, :setChecked => true)
	end
end
