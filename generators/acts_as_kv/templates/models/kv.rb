class <%= class_name %>Error < StandardError; end
class <%= class_name %> < ActiveRecord::Base
  
  class << self
  
    def get(key)
      kv = <%= class_name %>.find_by_key(key.to_s)
      if kv
        kv.value
      else
        raise <%= class_name %>Error.new "value not found for key: #{key}"
      end
    end
    
    def set(key, value)
      if exist_record = <%= class_name %>.find_by_key(key.to_s)
        kv = exist_record
        kv.value = value
      else
        kv = self.new({
          :key   => key.to_s,
          :value => value
        })
      end
      kv.save
      value
    end
    
    def drop(key)
      kv = <%= class_name %>.find_by_key(key.to_s)
      if kv
        kv.destroy
      else
        raise <%= class_name %>Error.new "value not found for key: #{key}"
      end
    end
  end
end
