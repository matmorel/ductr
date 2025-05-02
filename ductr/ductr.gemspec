# frozen_string_literal: true

require_relative "../mono_repo"
require_relative "lib/ductr/version"

Gem::Specification.new do |spec|
  spec.name = "ductr"
  spec.version = Ductr::VERSION
  spec.summary = "Data pipeline and ETL framework."
  spec.description = "A data pipeline and ETL framework for ruby."

  MonoRepo.add_metadata(spec)
  MonoRepo.add_files(spec, __dir__, __FILE__)
  MonoRepo.add_development_dependencies(spec)

  spec.add_dependency "activejob", "~> 8.0"
  spec.add_dependency "annotable", "~> 0.1"
  spec.add_dependency "colorize", "~> 0.8"
  spec.add_dependency "kiba", "~> 4.0"
  spec.add_dependency "rufus-scheduler", "~> 3.9"
  spec.add_dependency "thor", "~> 1.3"
  spec.add_dependency "zeitwerk", "~> 2.7"
end
