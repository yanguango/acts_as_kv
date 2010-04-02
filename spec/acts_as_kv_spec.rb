require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "acts_as_kv"

describe "ActsAsKv" do
  
  before(:each) do
    KvDb.send(:include, ActsAsKv)
  end
  
  describe ".get, .set" do
    
    it "should have get method" do
      pending
      KvDb.respond_to?(:get).should == true
    end

    it "should have set method" do
      pending
      KvDb.respond_to?(:set).should == true
    end

    it "should get correct value for a specify key" do
      pending
      value = { :a => 1, :b => 2}
      KvDb.set(:key_a, value)
      KvDb.get(:key_a).should == value
    end
    
  end
  
  describe ".drop" do
    
    it "should have drop method" do
      pending
      KvDb.respond_to?(:drop).should == true
    end
    
    it "should drop the kv" do
      pending
      KvDb.set(:key_c, { :a => 1})
      KvDb.get(:key_c).should == { :a => 1}
      KvDb.drop(:key_c)
      KvDb.get(:key_c).should raise_error
    end
    
  end
  
end