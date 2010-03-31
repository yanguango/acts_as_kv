class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table "<%= table_name %>", :force => true do |t|
      t.column :key,        :string, :limit => 100, :null => true
      t.column :value,      :string, :limit => 100, :default => '', :null => true

    end
    add_index :<%= table_name %>, :key, :unique => true
  end

  def self.down
    drop_table "<%= table_name %>"
  end
end