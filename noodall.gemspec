# -*- encoding: utf-8 -*-
require File.expand_path("../lib/noodall/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "noodall"
  s.version     = Noodall::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/noodall"
  s.summary     = "Noodall meta-gem that depends on the other components"
  s.description = "Noodall meta-gem that depends on the other components. UI and Core data objects."

  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency 'rails', "~> 3.0.1"
  s.add_dependency 'noodall-core', ">= 0"
  s.add_dependency 'noodall-ui', ">= 0"
#  s.add_dependency 'noodall-devise', ">= 0"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
