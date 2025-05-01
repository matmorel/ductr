# frozen_string_literal: true

require_relative "lib/ductr/postgres/version"

Gem::Specification.new do |spec|
  spec.name = "ductr-postgres"
  spec.version = Ductr::Postgres::VERSION
  spec.authors = ["Mathieu MOREL"]
  spec.email = ["mathieu@lamanufacture.dev"]
  spec.licenses = ["LGPL-3.0-or-later"]

  spec.summary = "PostgreSQL adapter for Ductr using the `sequel` gem"
  spec.description = "Allows ductr to interact with PostgreSQL DMBS."
  spec.homepage = "https://github.com/ductr-io/ductr"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ductr", "~> 0.2"
  spec.add_dependency "pg", "~> 1.5"
  spec.add_dependency "sequel", "~> 5.67"
  spec.add_dependency "sequel_pg", "~> 1.17"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "redcarpet", "~> 3.6"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.50"
  spec.add_development_dependency "rubocop-rspec", "~> 2.20"
  spec.add_development_dependency "simplecov", "~> 0.22"
  spec.add_development_dependency "sord", "~> 5.0"
  spec.add_development_dependency "yard", "~> 0.9"
end
