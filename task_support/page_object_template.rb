require 'erb'
class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr('-', '_').
    downcase
  end
end

class PageObjectTemplate
  BASE_PATH       = File.expand_path('../../', __FILE__)
  PAGE_FOLDER     = 'app/pages'
  PATH            = BASE_PATH + '/' +PAGE_FOLDER
  FILE_WRITE_MODE = 'w+'
  FILE_EXTENSION  = '.rb'

  def initialize(class_name, readable_page_name, post_page_class='""')
    @class_name      = class_name
    @page_name       = readable_page_name
    @post_page_class = post_page_class
  end

  def create_page_in_folder(folder_name)
    file_name   = @class_name.underscore + FILE_EXTENSION
    folder_path = PATH + '/' + folder_name.underscore
    file_path   = folder_path+ '/' + file_name
    create_folder folder_path
    create_and_write_to_file file_path
  end

  private
  def create_and_write_to_file(path)
    File.open(path, FILE_WRITE_MODE) { |f| f.puts content }
  end

  def content
    ERB.new(template).result(binding)
  end

  def create_folder(folder_path)
    Dir.mkdir folder_path unless folder_exists? folder_path
  end

  def folder_exists?(folder)
    Dir.exists? folder
  end

  def template
    IO.read(File.expand_path('../',__FILE__)+ '/' + 'page_template.erb')
  end
end