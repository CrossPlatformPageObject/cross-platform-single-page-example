module Transitional

	def get_matching_page(transitions)
		return page(transitions[:default]) unless transitions[:default].nil?
		next_page_transitions = transitions[:to]
		# wait for 60 sec trying to find if any of the next page transitions has loaded
		matching_next_page    = wait_till_next_page_loads(next_page_transitions, transitions[:error])
		matching_next_page
	end

	def wait_till_next_page_loads(next_page_transitions, error_page)
		next_pages                 = next_page_transitions.map { |page_class| page(page_class) }
		error_page                 = page(error_page)
		has_error, found_next_page = false, false
		begin
			wait_for_element(timeout: 30) do
				found_next_page = next_pages.any? { |page| page.current_page? false }
				has_error       = error_page.has_error? if error_page && found_next_page==false
				found_next_page or has_error
			end
			has_error ? error_page : next_pages.find { |page| page.current_page? false }
		rescue WaitTimeoutError
			raise WaitTimeoutError, "None of the next page transitions were found. Checked for: => #{next_page_transitions.join(' ,')}"
		end
	end

	def page(page_arg)
		page_arg.is_a?(Class) ? PageRegistry.get(page_arg) : page_arg
	end

	def wait_for_element(options)
		retry_frequency=0.5
		begin
			Timeout::timeout(options[:timeout], WaitTimeoutError) do
				sleep(retry_frequency) until yield
			end
		end
	end

end