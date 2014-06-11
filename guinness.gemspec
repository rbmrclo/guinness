# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guinness/version'

Gem::Specification.new do |spec|
  spec.name          = "guinness"
  spec.version       = Guinness::VERSION
  spec.authors       = ["Robbie Marcelo"]
  spec.email         = ["rbmrclo@hotmail.com"]
  spec.summary       = %q{Guinness is a nano framework for building simple static websites. }
  spec.description   = %q{Guinness is A nano framework for building simple static websites. }
  spec.homepage      = "https://github.com/rbmrclo/guinness"
  spec.license       = "MIT"

  spec.files         = Dir['{bin,lib,test}/**/*']
  spec.executables   = %w[ guinness ]
  spec.require_paths = ["lib"]

  spec.add_dependency 'rack'
  spec.add_dependency 'tilt'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency "bundler"
end
