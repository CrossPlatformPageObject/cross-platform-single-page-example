require 'calabash-android/cucumber'
require_relative '../support/file_inclusion'
require_relative '../support/page_building_helper'

APK_PATH ||= 'prebuilt/Foodoo.apk'

FileInclusion.require_common_files
FileInclusion.require_platform_specific_files 'droid'
PageBuildingHelper.build_pages
PageBuildingHelper.set_home_page_as_food_list


device  = `adb devices`.scan(/\n(.*)\t/).flatten.first
command = "calabash-android run #{APK_PATH} -p report --format pretty  ADB_DEVICE_ARG=#{device}"
# bash command


