# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usda_nutrient_database/version'

Gem::Specification.new do |spec|
  spec.name          = 'usda-nutrient-database'
  spec.version       = UsdaNutrientDatabase::VERSION
  spec.authors       = ['Matt Beedle']
  spec.email         = ['mattbeedle@googlemail.com']
  spec.description   = %q{A gem to include all the USDA nutrient data quickly into a ruby project}
  spec.summary       = %q{A gem to include all the USDA nutrient data quickly into a ruby project}
  spec.homepage      = 'https://github.com/mattbeedle/usda-nutrient-database'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '>= 3.0.0'
  spec.add_runtime_dependency 'activerecord-import'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'rubyzip'

  if RUBY_PLATFORM == 'java'
    spec.add_development_dependency 'activerecord-jdbcpostgresql-adapter'
  end
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'sqlite3' if RUBY_PLATFORM != 'java'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pg' if RUBY_PLATFORM != 'java'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'webmock'
end
