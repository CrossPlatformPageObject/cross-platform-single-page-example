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
				:droid => "#{@name}"
			},
			{
				:to => @page
			})
	end

	def click
		@menu_button.click_menu
	end

	def visible?
		@menu_button.exists?
	end

	def is_secondary?
		@type == SECONDARY
	end
end
