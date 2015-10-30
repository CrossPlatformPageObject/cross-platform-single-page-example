require 'calabash-android/cucumber'
require 'pry'

PROJECT_ROOT = '/Users/Priti/projects/POP/cross_platform_single_page'
APK_PATH     = 'prebuilt/Foodoo.apk'

def require_common_files
	Dir["#{PROJECT_ROOT}/app/page/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/pages/**/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/models/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/framework/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/framework/elements/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/step_definitions/*.rb"].each { |file| require "#{file}" }
end

def require_droid_files
	Dir["#{PROJECT_ROOT}/droid/framework/*.rb"].each { |file| require "#{file}" }
end

def build_pages
	PageRegistry.build
	App.set_current_page(FoodList)
end

def resign_app
	command = "calabash-android resign #{APK_PATH}"
	sh command
end

require_common_files
require_droid_files
build_pages
# resign_app

device  = `adb devices`.scan(/\n(.*)\t/).flatten.first
command = "calabash-android run #{APK_PATH} -p report --format pretty  ADB_DEVICE_ARG=#{device}"
# bash command


