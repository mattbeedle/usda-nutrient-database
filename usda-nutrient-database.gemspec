# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usda/nutrient/database/version'

Gem::Specification.new do |spec|
  spec.name          = "usda-nutrient-database"
  spec.version       = Usda::Nutrient::Database::VERSION
  spec.authors       = ["Matt Beedle"]
  spec.email         = ["mattbeedle@googlemail.com"]
  spec.description   = %q{A gem to include all the USDA nutrient data quickly into a ruby project}
  spec.summary       = %q{A gem to include all the USDA nutrient data quickly into a ruby project}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
