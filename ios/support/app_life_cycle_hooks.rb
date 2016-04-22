require 'calabash-cucumber/launcher'

Before do |scenario|
	@calabash_launcher = Calabash::Cucumber::Launcher.new
	scenario_tags = scenario.source_tag_names
	if scenario_tags.include?('@reinstall')
		@calabash_launcher.reset_app_jail
	end
	unless @calabash_launcher.calabash_no_launch?
		launch_options = {:uia_strategy => :host, }
		@calabash_launcher.relaunch(launch_options)
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
