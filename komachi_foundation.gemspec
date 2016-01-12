# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'komachi_foundation/version'

Gem::Specification.new do |spec|
  spec.name          = "komachi_foundation"
  spec.version       = KomachiFoundation::VERSION
  spec.authors       = ["mitaku"]
  spec.email         = ["mitaku1104@gmail.com"]

  spec.summary       = %q{template generator}
  spec.description   = %q{It's a tool for applying the application of the template.}
  spec.homepage      = "https://github.com/mitaku/komachi_foundation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
