# frozen_string_literal: true

require_relative "../mono_repo"
require_relative "lib/ductr/postgres/version"

Gem::Specification.new do |spec|
  spec.name = "ductr-postgres"
  spec.version = Ductr::Postgres::VERSION
  spec.summary = "PostgreSQL adapter for Ductr using the `sequel` gem"
  spec.description = "Allows ductr to interact with PostgreSQL DMBS."

  MonoRepo.add_metadata(spec)
  MonoRepo.add_files(spec, __dir__, __FILE__)
  MonoRepo.add_development_dependencies(spec)

  spec.add_dependency(*MonoRepo::DUCTR)
  spec.add_dependency "pg", "~> 1.5"
  spec.add_dependency(*MonoRepo::SEQUEL)
  spec.add_dependency "sequel_pg", "~> 1.17"
end
