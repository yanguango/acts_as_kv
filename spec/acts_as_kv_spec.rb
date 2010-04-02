require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "acts_as_kv"

describe "ActsAsKv" do
  
  before(:each) do
    KvDb.send(:include, ActsAsKv)
  end
  
  describe ".get" do
    
    it "should have get method" do
      pending
      KvDb.respond_to?(:get).should == true
    end
    
  end
  
  describe ".set" do
  
    it "should have set method" do
      pending
      KvDb.respond_to?(:set).should == true
    end
    
  end
  
  describe ".drop" do
    
    it "should have drop method" do
      pending
      KvDb.respond_to?(:drop).should == true
    end
    
  end
  
end