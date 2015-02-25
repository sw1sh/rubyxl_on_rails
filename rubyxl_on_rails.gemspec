# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubyxl_on_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "rubyxl_on_rails"
  spec.version       = RubyxlOnRails::VERSION
  spec.authors       = ["Nikolay Murzin"]
  spec.email         = ["murzin.nikolay@gmail.com"]

  spec.summary       = %q{Support for XLSX based views}
  spec.description   = %q{A gem to generate xlsx documents by using rxlsx templates.}
  spec.homepage      = "https://github.com/sw1sh/rubyxl_on_rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'rails', '~> 4.0 '
  spec.add_dependency 'rubyXL', git: 'git@github.com:sw1sh/rubyXL.git'
end
