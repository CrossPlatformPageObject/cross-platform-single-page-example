require 'watir-webdriver'
require_relative '../../support/file_inclusion'


def create_driver
  driver_path = "#{FileInclusion::PROJECT_ROOT}/prebuilt/chromedriver"
  Selenium::WebDriver.for :chrome, driver_path: driver_path
  driver = Selenium::WebDriver.for :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
  browser = Watir::Browser.new(driver)
  browser
end

B = create_driver

Before do |scenario|
  B.cookies.clear
  B.goto 'http://localhost:3000'
  B.refresh
  Watir::Wait.until { B.ready_state == 'complete' }
end

After do |scenario|
	B.close
end
