class MenuItem
	PRIMARY   = 1
	SECONDARY = 2
	attr_accessor :name, :page, :type

	def initialize(name, page, type = PRIMARY)
		@name       = name
		@page       = page
		@type       = type
		@menu_button = Field.transition_element(
			{
				:web   => "//div[@id='home']//ul[@id='home_options']//li[@class='#{@name.downcase}']",
				:ios   => "label marked:'#{@name}'",
				:droid => "WhitneyDefaultTextView id:'drawer_item_text' text:'#{@name}'"
			},
			{
				:to => @page
			})
	end

	def click
		@menu_button.click
	end

	def visible?
		return false if @name=='Parking Reminder'
		@menu_button.exists?(2)
	end

	def is_secondary?
		@type == SECONDARY
	end
end
