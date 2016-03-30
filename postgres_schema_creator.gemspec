# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postgres_schema_creator/version'

Gem::Specification.new do |spec|
  spec.name          = "postgres_schema_creator"
  spec.version       = PostgresSchemaCreator::VERSION
  spec.authors       = ["Pedro Cavalheiro"]
  spec.email         = ["pedrohc@gmail.com"]

  spec.summary       = "Helps creating schemas for PostgreSQL based applications"
  spec.description   = "This creates a hook in 'rake db:create' to create PostgreSQL's schema, if needed (schema name is defined by schema_search_path in config/database.yml ). It also checks if the schema already exists, to avoid any errors."
  spec.homepage      = "https://github.com/pecavalheiro/rails-postgres-schema-creator"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
