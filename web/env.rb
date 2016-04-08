require 'watir-webdriver'
require_relative '../support/file_inclusion'
require_relative '../support/page_building_helper'


FileInclusion.require_common_files
FileInclusion.require_platform_specific_files 'droid'
PageBuildingHelper.build_pages
PageBuildingHelper.set_home_page_as_food_list

DRIVER_PATH  ='/Applications/chromedriver'

def create_driver
	Selenium::WebDriver::Chrome::Service.executable_path = DRIVER_PATH
	prefs = {
		download: {
			prompt_for_download: false,
			default_directory:   DRIVER_PATH
		}
	}
	browser = Watir::Browser.new :chrome, :prefs => prefs
	browser
end

browser = create_driver

Before do |scenario|
	browser.cookies.clear
	browser.goto 'http://localhost:3000'
	browser.wait
end

After do |scenario|
	browser.close
end


