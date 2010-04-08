require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require "acts_as_kv"
require "acts_as_kv/version"

describe "ActsAsKv" do
  
  before(:each) do
    KvDb.send(:include, ActsAsKv)
    KvDb.set(:key_a, { :a => 1})
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
  
  describe ".rename" do
    
    it "should rename the key correctly" do
      KvDb.set(:key_d, { :d => 1})
      orgin_value_for_key_d = KvDb.get(:key_d)
      KvDb.rename(:key_d, :key_e)
      lambda { KvDb.get(:key_d) }.should raise_error
      KvDb.get(:key_e).should == orgin_value_for_key_d
    end
    
  end
  
  describe ".set" do
    
    it "should accept set as value" do
      pending
    end
    
  end
  
end