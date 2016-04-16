require 'calabash-cucumber/cucumber'
require 'calabash-cucumber/launcher'
# require 'active_support/core_ext'
require 'pry'

require_relative '../support/file_inclusion'
require_relative '../support/page_building_helper'

# APP_PATH = '/Users/Priti/Library/Developer/Xcode/DerivedData/FoodX-dvjlpmcavoodkjbjxfbtotlaocec/Build/Products/Debug-iphonesimulator/FoodX.app'
# APP_PATH = '/prebuilt/FoodX.app'

ENV['DEVICE_TARGET']   = 'iPhone 6 (9.0)'
ENV['APP_BUNDLE_PATH'] = 'prebuilt/FoodX.app'

FileInclusion.require_common_files
FileInclusion.require_platform_specific_files 'ios'
require_relative '../ios/monkey_patches/calabash_launcher'
PageBuildingHelper.build_pages
PageBuildingHelper.set_home_page_as_food_list

# begin
# 	`calabash-ios sim acc -v`
# 	binding.pry
# 	# start_test_server_in_background
# rescue TimeoutError
# 	puts 'Timeout error'
# end

