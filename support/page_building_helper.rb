module PageBuildingHelper

	def self.build_pages
		PageRegistry.build
	end

	def self.set_home_page_as_food_list
		App.set_current_page(FoodList)
	end

end