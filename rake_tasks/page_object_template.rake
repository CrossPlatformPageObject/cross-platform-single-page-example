require_relative '../task_support/page_object_template'

def prompt_for_message(message)
	puts message
	input_value = STDIN.gets.strip
	input_value
end

namespace :page_object do
	desc 'create a page object class when given a class, name, '
	task :create, [:class_name, :friendly_name, :folder_name, :post_class_name] do |t, args|
		class_name      = args.class_name
		friendly_name   = args.friendly_name
		folder_name     = args.folder_name
		post_class_name = args.post_class_name

		if class_name.nil?
			class_name = prompt_for_message 'Enter class Name : '
		end

		if friendly_name.nil?
			friendly_name = prompt_for_message 'Enter friendly name : '
		end

		if folder_name.nil?
			folder_name = prompt_for_message 'Enter Folder name : '
		end

		folder_name     = class_name if folder_name.nil? or folder_name.empty?
		post_class_name = "''" if post_class_name.nil?

		begin
			page = PageObjectTemplate.new(class_name, friendly_name, post_class_name)
			page.create_page_in_folder folder_name
		end
	end
end

