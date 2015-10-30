require 'active_support/all'

class App
	@current_page = nil
	class << self

		def set_current_page(page)
			@current_page = PageRegistry.get page
		end

		def current_page
			@current_page
		end

		def self.configure_shorthands(dir)
			Dir[dir].each do |f|
				file_name = File.basename(f, '.rb')
				define_method("#{file_name}_page") {
					begin
						PageRegistry.get(file_name.camelize.constantize)
					rescue
						PageRegistry.get(file_name.upcase.constantize)
					end
				}
			end
		end

		configure_shorthands "#{PROJECT_ROOT}/app/pages/**/*.rb"
	end
end
