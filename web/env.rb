require_relative '../support/file_inclusion'
require_relative '../support/page_building_helper'

FileInclusion.require_common_files
FileInclusion.require_platform_specific_files 'web'
PageBuildingHelper.build_pages
PageBuildingHelper.set_home_page_as_food_list


