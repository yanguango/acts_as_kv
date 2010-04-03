require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "acts_as_kv"
require "acts_as_kv/version"

describe "ActsAsKv" do
  
  before(:each) do
    KvDb.send(:include, ActsAsKv)
  end
  
  it { ActsAsKv::VERSION.should == '0.0.1' }
  
  describe ".get, .set" do
    
    it "should have get method" do
      KvDb.respond_to?(:get).should == true
    end

    it "should have set method" do
      KvDb.respond_to?(:set).should == true
    end

    it "should get correct value for a specify key" do
      value = { :a => 1, :b => 2}
      KvDb.set(:key_a, value)
      KvDb.get(:key_a).should == value
    end
    
  end
  
  describe ".drop" do
    
    it "should have drop method" do
      KvDb.respond_to?(:drop).should == true
    end
    
    it "should drop the kv" do
      KvDb.set(:key_c, { :a => 1})
      KvDb.get(:key_c).should == { :a => 1}
      KvDb.drop(:key_c)
      lambda { KvDb.get(:key_c) }.should raise_error
    end
    
  end
  
end