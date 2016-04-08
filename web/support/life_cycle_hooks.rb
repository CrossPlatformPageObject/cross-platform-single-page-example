require 'watir-webdriver'
require_relative '../../support/file_inclusion'


def create_driver
	driver_path  = "#{FileInclusion::PROJECT_ROOT}/prebuilt/chromedriver_mac"
	Selenium::WebDriver::Chrome::Service.executable_path = driver_path
	prefs = {
		download: {
			prompt_for_download: false,
			default_directory:   driver_path
		}
	}
	browser = Watir::Browser.new :chrome, :prefs => prefs
	browser
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
