module FileInclusion
	PROJECT_ROOT = '/Users/Priti/projects/POP/cross_platform_single_page'

	def self.require_common_files
		common_directories =%w(/app/page/*.rb /app/pages/**/*.rb /app/*.rb /app/models/*.rb /framework/*.rb /framework/elements/*.rb /step_definitions/*.rb)
		common_directories.each do |dir|
			Dir["#{PROJECT_ROOT}#{dir}"].each { |file| require "#{file}" }
		end
	end

	def self.require_platform_specific_files(platform)
		Dir["#{PROJECT_ROOT}/#{platform}/framework/*.rb"].each { |file| require "#{file}" }
	end

end