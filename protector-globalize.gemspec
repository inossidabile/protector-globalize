# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'protector/globalize/version'

Gem::Specification.new do |spec|
  spec.name          = "protector-globalize"
  spec.version       = Protector::Globalize::VERSION
  spec.authors       = ["Boris Staal"]
  spec.email         = ["boris@staal.io"]
  spec.description   = %q{Integration layer between Protector and Globalize}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "protector", ">= 0.5.3"
  spec.add_dependency "globalize"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
