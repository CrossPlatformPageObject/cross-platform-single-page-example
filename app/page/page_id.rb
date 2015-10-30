class PageId

	attr_reader :id_map

	def initialize(id_map)
		@driver = Driver.get_driver
		@id_map = id_map
	end

	def exists?
		@driver.exists?(@id_map)
	end

end
