module ActsAsKv
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
  
    def get
      
    end
    
  end
  
end