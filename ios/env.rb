require 'calabash-android/cucumber'
require 'calabash-cucumber/launcher'
require_relative '../support/file_inclusion'
require_relative '../support/page_building_helper'

APP_PATH = '/Users/Priti/Library/Developer/Xcode/DerivedData/FoodX-dvjlpmcavoodkjbjxfbtotlaocec/Build/Products/Debug-iphonesimulator/FoodX.app'

FileInclusion.require_common_files
FileInclusion.require_platform_specific_files 'ios'
PageBuildingHelper.build_pages
PageBuildingHelper.set_home_page_as_food_list

