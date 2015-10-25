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

	def click
		locator = get_locator_from_id_map
		return if locator.empty?
		touch_element locator
	end

	private
	def get_locator_from_id_map

	end
end
