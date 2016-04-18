require 'net/http'
require 'pry'

MOBILE_WEB = File.expand_path(File.join(File.dirname(__FILE__), '../../web_food_app'))

namespace :run do

	desc 'Run ios automation'
	task :ios do
		begin
			`bundle exec cucumber -p ios`
		rescue => ex
			p ex.backtrace
		end
	end

	desc 'Run droid automation'
	task :droid do
		begin
			sh 'calabash-android run prebuilt/FoodX-droid.apk -p android'
		rescue => ex
			p ex.backtrace
		end
	end

	desc 'Run web automation'
	task :web do
		begin
			# cd MOBILE_WEB do
			# 	sh 'rake web:start_server_in_daemon'
			# end
				sh 'bundle exec cucumber -r web'
		rescue => ex
			p ex
			p ex.backtrace
		ensure
			# cd MOBILE_WEB do
			# 	sh 'rake web:stop_server'
			# end
		end
	end
end





