require 'watir-webdriver'

PROJECT_ROOT = '/Users/Priti/projects/POP/cross_platform_single_page'
DRIVER_PATH ='/Applications/chromedriver'


def require_common_files
	Dir["#{PROJECT_ROOT}/app/page/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/pages/**/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/framework/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/framework/elements/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/step_definitions/*.rb"].each { |file| require "#{file}" }
end

def create_driver
	Selenium::WebDriver::Chrome::Service.executable_path = DRIVER_PATH
	prefs = {
		:download => {
			prompt_for_download: false,
			default_directory:   DRIVER_PATH
		}
	}
	b = Watir::Browser.new :chrome, :prefs => prefs
	b
end

require_common_files
B = create_driver

Before do |scenario|
	B.cookies.clear
	B.goto 'http://localhost:3000/items/index'
	B.wait
end

After do |scenario|
	# B.close
end


