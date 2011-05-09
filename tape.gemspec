# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
Gem::Specification.new do |s|
  s.name        = "tape"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alexander Flatter"]
  s.email       = ["aflatter@farbenmeer.net"]
  s.homepage    = "http://github.com/aflatter/tape"
  s.summary     = ""
  s.description = ""
 
  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "activesupport", ">= 3.0"
  s.add_dependency "mail"

  s.add_development_dependency "rake"
  s.add_development_dependency "actionmailer"
  s.add_development_dependency "actionmailer-maildir"
  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "fakefs"
 
  s.files        = Dir.glob("{bin,lib}/**/*") + %w(MIT-LICENSE README.md)
  s.require_path = 'lib'
end
