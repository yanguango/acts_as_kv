# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'acts_as_kv/version'
 
Gem::Specification.new do |s|
  s.name        = "acts_as_kv"
  s.version     = ActsAsKv::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Roc Yu", "Sam Yan"]
  s.email       = ["rociiu.yu@gmail.com", "yanguango@gmail.com"]
  s.homepage    = "http://github.com/isamsam/acts_as_kv"
  s.summary     = "A key-value db simulator"
  s.description = "Simulate a key-value db using AR"
 
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "acts_as_kv"
 
  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{lib}/**/*") + %w(MIT-LICENSE README.textile)
  s.require_path = 'lib'
end