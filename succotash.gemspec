# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'succotash/version'

Gem::Specification.new do |spec|
  spec.name          = "succotash"
  spec.version       = Succotash::VERSION
  spec.authors       = ["Hassan Khalid", "John Cleary"]
  spec.email         = ["dev@createk.io"]

  spec.summary       = "A simple seeding strategy for your project which helps maintain and separate static and sample data."
  spec.description   = "A simple seeding strategy for your project which helps maintain and separate static and sample data."
  spec.homepage      = "https://github.com/CreatekIO/succotash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "version", "~> 1.0.0"
  spec.add_dependency "colorize", "0.7.7"
end
