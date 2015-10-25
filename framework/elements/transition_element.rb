require 'timeout'

class TransitionElement < Element

	def initialize(id_map, transitions)
		super(id_map)
		@transitions = transitions

		if transitions[:to]
			raise 'transitions[:to] should be a page class or an array of page classes' unless (transitions[:to].is_a? Array) || (transitions[:to].is_a? Class)
		end

		if transitions[:to].is_a? Class
			@transitions[:to] = [transitions[:to]]
		end
	end

	def exists?(wait=40, *args)
		@driver.exists?(interpolate_locators_with_params(*args), wait)
	end

	def click(*locator_params)
		@driver.click(interpolate_locators_with_params(*locator_params))
		transition(@transitions)
	end

end
