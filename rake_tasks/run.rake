require 'net/http'
require 'pry'

MOBILE_WEB = File.expand_path(File.join(File.dirname(__FILE__), '../../web_food_app'))
OUTPUT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '../report/'))

namespace :run do

	desc 'Run ios automation'
	task :ios, :tag do |t, args|
		begin
			command = "bundle exec cucumber -p ios --format pretty --format html --out #{OUTPUT_DIR}/iOS_Automation_report.html"
			command += " --tags #{args.tag}" unless args.nil?
			sh command
		rescue => ex
			p ex.backtrace
		end
	end

	desc 'Run droid automation'
	task :droid, :tag do |t, args|
		begin
			command = "calabash-android run prebuilt/FoodX-droid.apk -p android --format pretty --format html --out #{OUTPUT_DIR}/droid_Automation_report.html"
			command += " --tags #{args.tag}" unless args.nil?
			sh command
		rescue => ex
			p ex.backtrace
		end
	end

	desc 'Run web automation'
	task :web, :tag do |t, args|
		begin
			command = "bundle exec cucumber -r web --format pretty --format html --out #{OUTPUT_DIR}/web_Automation_report.html"
			command += " --tags #{args[:tag]}" unless args.nil?
			puts command
			sh command
		rescue => ex
			p ex
			p ex.backtrace
		end
	end
end





