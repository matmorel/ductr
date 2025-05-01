# frozen_string_literal: true

module MonoRepo
  DUCTR = ["ductr", ">= 0.2"].freeze
  SEQUEL = ["sequel", "~> 5.91"].freeze

  class << self
    def add_development_dependencies(gemspec)
      gemspec.add_development_dependency "debug", "~> 1.10"
      gemspec.add_development_dependency "rake", "~> 13.0"
      gemspec.add_development_dependency "redcarpet", "~> 3.6"
      gemspec.add_development_dependency "rspec", "~> 3.13"
      gemspec.add_development_dependency "rubocop", "~> 1.75"
      gemspec.add_development_dependency "rubocop-rspec", "~> 3.6"
      gemspec.add_development_dependency "ruby-lsp", "~> 0.23"
      gemspec.add_development_dependency "simplecov", "~> 0.22"
      gemspec.add_development_dependency "sord", "~> 7.0"
      gemspec.add_development_dependency "yard", "~> 0.9"
    end
  end
end
