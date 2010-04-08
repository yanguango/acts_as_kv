require 'spec'
require 'rubygems'
gem 'activerecord', '<=2.3.5'
require 'active_record' 


ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.configurations = true

ActiveRecord::Schema.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  
  create_table :kv_dbs do |t|
    t.string :key
    t.text :value
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
