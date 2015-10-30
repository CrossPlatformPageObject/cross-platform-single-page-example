class Page
	attr_reader :name, :id

	def initialize(name)
		raise "@id not found for #{self.class}. PageId object is required to be defined for every page" unless @id
		@name   = name
		@driver = Driver.get_driver
	end

	def current_page?(wait=40)
		@id.exists?
	end

	def has_error?
		false
	end

	def await
		begin
			@driver.await(@id.id_map)
		rescue WaitTimeoutError
			raise "Page #{self.class} not found."
		end
	end

	def back
		@driver.back
	end

end
