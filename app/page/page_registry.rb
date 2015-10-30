class PageRegistry

	class <<self

		@@page_classes = []

		def build
			create_page_objects_map
		end

		def contains(page_name)
			not get(page_name).nil?
		end

		# lookup pages by pageName or className
		def get(page)
			if page.is_a? String
				lookup_by_page_name(page)
			elsif page.is_a? Class
				lookup_by_class_name(page)
			end
		end

		def register_page(page_class)
			@@page_classes.push(page_class)
		end

		private
		def create_page_objects_map
			@page_objs = {}
			@@page_classes.each { |pageClass|
				page = pageClass.new
				@page_objs[page.name] = page
			}
		end

		def lookup_by_class_name(page_class)
			match = @page_objs.find { |pageName, page_obj| page_obj.class == page_class }
			match[1]
		end

		def lookup_by_page_name(page_name)
			@page_objs[page_name]
		end

	end
end
