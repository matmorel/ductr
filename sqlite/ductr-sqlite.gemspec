# frozen_string_literal: true

require_relative "../mono_repo"
require_relative "lib/ductr/sqlite/version"

Gem::Specification.new do |spec|
  spec.name = "ductr-sqlite"
  spec.version = Ductr::SQLite::VERSION
  spec.summary = "SQLite adapter for Ductr using the `sequel` gem"
  spec.description = "Allows ductr to interact with SQLite DMBS."

  MonoRepo.add_metadata(spec)
  MonoRepo.add_files(spec, __dir__, __FILE__)
  MonoRepo.add_development_dependencies(spec)

  spec.add_dependency(*MonoRepo::DUCTR)
  spec.add_dependency(*MonoRepo::SEQUEL)
  spec.add_dependency "sqlite3", "~> 2.6"
end
