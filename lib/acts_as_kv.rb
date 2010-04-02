module ActsAsKv
  
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:serialize, :value)
  end
  
  class ValueNotFound < StandardError; end
  
  module ClassMethods
  
    def get(key)
      object = self.find_by_key(key.to_s)
      if object
        object.value
      else
        raise ValueNotFound.new("Value for key: #{key} not found")
      end
    end
    
    def set(key, value)
      object = self.find_by_key(key.to_s)
      if object
        object.value = value
      else
        object = self.new( { :key => key.to_s, :value => value } )
      end
      object.save
      object.value
    end
    
    def drop(key)
      object = self.find_by_key(key.to_s)
      if object
        object.destroy
      end
    end
    
  end
  
end