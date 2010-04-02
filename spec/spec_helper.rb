require 'spec'
require 'rubygems'
require 'ruby-debug'
require 'active_record'

ENV['TZ'] = 'UTC'
Time.zone = 'Eastern Time (US & Canada)'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.configurations = true

ActiveRecord::Schema.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  
  create_table :kv_dbs do |t|
    t.string :key
    t.string :value
  end
  
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

Spec::Runner.configure do |config|
  
  config.before(:each) do
    
    class KvDb < ActiveRecord::Base
    end
    
    KvDb.destroy_all
  end
  
  config.after(:each) do
    Object.send(:remove_const, :KvDb)
  end
  
end
