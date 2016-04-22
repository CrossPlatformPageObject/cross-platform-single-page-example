require 'net/http'
require 'pry'

MOBILE_WEB = File.expand_path(File.join(File.dirname(__FILE__), '../../web_food_app'))

namespace :run do

	desc 'Run ios automation'
	task :ios, :tag do |t, args|
		begin
			command = 'bundle exec cucumber -p ios'
			command += " --tags #{args.tag}" unless args.nil?
			sh command
		rescue => ex
			p ex.backtrace
		end
	end

	desc 'Run droid automation'
	task :droid, :tag do |t, args|
		begin
			command = 'calabash-android run prebuilt/FoodX-droid.apk -p android'
			command += " --tags #{args.tag}" unless args.nil?
			sh command
		rescue => ex
			p ex.backtrace
		end
	end

	desc 'Run web automation'
	task :web, :tag do |t, args|
		begin
			command = 'bundle exec cucumber -r web'
			command += " --tags #{args[:tag]}" unless args.nil?
			puts command
			sh command
		rescue => ex
			p ex
			p ex.backtrace
		end
	end
end





