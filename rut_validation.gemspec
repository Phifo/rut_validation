# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rut_validation/version'

Gem::Specification.new do |spec|
  spec.name          = "rut_validation"
  spec.version       = RutValidation::VERSION
  spec.authors       = ["Christopher Fernández"]
  spec.email         = ["fernandez.chl@gmail.com"]
  spec.description   = %q{RUT/RUN Chilean validator for Rails models}
  spec.summary       = %q{RUT/RUN Chilean validator for Rails models}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", ">= 4.1"

  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "activerecord", "~> 4.1"
  spec.add_development_dependency "sqlite3", "~> 1.3.9"
end
