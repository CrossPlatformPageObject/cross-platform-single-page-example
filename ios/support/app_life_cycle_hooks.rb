require 'calabash-cucumber/launcher'
require 'pry'

Before do |scenario|
	@calabash_launcher = Calabash::Cucumber::Launcher.new
	scenario_tags = scenario.source_tag_names
	if scenario_tags.include?('@reinstall')
		@calabash_launcher.reset_app_jail
	end
	unless @calabash_launcher.calabash_no_launch?
		@calabash_launcher.relaunch()
		@calabash_launcher.calabash_notify(self)
	end
end

After do |scenario|
	unless @calabash_launcher.calabash_no_stop?
		calabash_exit
		if @calabash_launcher.active?
			@calabash_launcher.stop
		end
	end
end
