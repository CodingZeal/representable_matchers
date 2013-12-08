# coding: utf-8
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'representable_matchers/version'
require 'representable'

Gem::Specification.new do |spec|
  spec.name          = "representable_matchers"
  spec.version       = RepresentableMatchers::VERSION
  spec.authors       = ["Coding Zeal", "Adam Cuppy"]
  spec.email         = ["info@codingzeal.com"]
  spec.description   = %q{Shoulda-style RSpec/Test Unit matchers for the Representable Gem}
  spec.summary       = %q{Shoulda-style RSpec/Test Unit matchers for the Representable Gem}
  spec.homepage      = "https://github.com/CodingZeal/representable_matchers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6.0"
  spec.add_development_dependency "representable", "~> 1.7.3"
end
