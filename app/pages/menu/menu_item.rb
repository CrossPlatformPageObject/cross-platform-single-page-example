class MenuItem
	PRIMARY   = 1
	SECONDARY = 2
	attr_accessor :name, :page, :type

	def initialize(name, page, type = PRIMARY)
		@name        = name
		@page        = page
		@type        = type
		@menu_button = Field.transition_element(
			{
				web:   { text: "#{@name}" },
				ios:   "label marked:'#{@name}'",
				droid: "* marked:'#{@name}'"
			},
			{
				to: @page
			})
	end

	def click
		@menu_button.click
	end

	def visible?
		@menu_button.exists?
	end

	def is_secondary?
		@type == SECONDARY
	end
end
