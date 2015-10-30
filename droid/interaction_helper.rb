module InteractionHelper

	def touch_element(locator)
		wait_for_element_to_appear locator
		touch locator
	end

	def wait_for_element_to_appear locator
		wait_for_elements_exist([locator],)
	end
end