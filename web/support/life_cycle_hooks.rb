require 'watir-webdriver'
require_relative '../../support/file_inclusion'

DRIVER_PATH  = "#{FileInclusion::PROJECT_ROOT}/prebuilt/chromedriver_mac"

def create_driver
	Selenium::WebDriver::Chrome::Service.executable_path = DRIVER_PATH
	prefs = {
		download: {
			prompt_for_download: false,
			default_directory:   DRIVER_PATH
		}
	}
	B = Watir::Brw.new :chrome, :prefs => prefs
	B
end

B = create_driver

Before do |scenario|
	B.cookies.clear
	B.goto 'http://localhost:3000'
	Watir::Wait.until {B.ready_state == 'complete'}
end

After do |scenario|
	B.close
end
