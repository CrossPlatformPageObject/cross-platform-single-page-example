require 'calabash-android/cucumber'
require 'calabash-cucumber/launcher'

PROJECT_ROOT = '/Users/Priti/projects/POP/cross_platform_single_page'
APP_PATH     = '/Users/Priti/Library/Developer/Xcode/DerivedData/FoodX-dvjlpmcavoodkjbjxfbtotlaocec/Build/Products/Debug-iphonesimulator/FoodX.app'

def require_common_files
	puts "requireing files"
	Dir["#{PROJECT_ROOT}/app/page/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/pages/**/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/app/models/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/framework/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/framework/elements/*.rb"].each { |file| require "#{file}" }
	Dir["#{PROJECT_ROOT}/step_definitions/*.rb"].each { |file| require "#{file}" }
end

def require_ios_files
	Dir["#{PROJECT_ROOT}/ios/framework/*.rb"].each { |file| require "#{file}" }
end

def build_pages
	PageRegistry.build
	App.set_current_page(FoodList)
end



require_common_files
require_ios_files
build_pages


