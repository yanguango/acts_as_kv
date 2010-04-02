require 'ruby-debug'
class ActsAsKvGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      m.migration_template 'migrations/create_kv_table.rb',"db/migrate", :migration_file_name => "create_#{file_name}"
      m.template 'models/kv.rb',File.join('app/models',class_path,"#{file_name}.rb")
    end
  end
end