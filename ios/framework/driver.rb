require 'calabash-cucumber/operations'
require_relative '../interaction_helper'

class Driver
	include Calabash::Cucumber::Operations
	include Cucumber::RbSupport::RbWorld
	include InteractionHelper

	@@DRIVER = nil
	PLATFORM = :ios

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

end
