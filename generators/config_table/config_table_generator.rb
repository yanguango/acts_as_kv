require 'ruby-debug'
class ConfigTableGenerator < Rails::Generator::NamedBase
  attr_accessor :migration_name, :migration_action

  def manifest
    @migration_name = "Create#{class_name}"
    @migration_action = "add"
    record do |m|
      m.migration_template 'migrations/create_config_table.rb',"db/migrate", :migration_file_name => "create_#{file_name}"
      m.template 'models/config_table.rb',File.join('app/models',class_path,"#{file_name}.rb")
    end
  end
end