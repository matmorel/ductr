# frozen_string_literal: true

module MonoRepo
  DUCTR = ["ductr", ">= 0.2"].freeze
  SEQUEL = ["sequel", "~> 5.91"].freeze

  class << self
    def add_metadata(gemspec)
      gemspec.authors = ["Mathieu Morel"]
      gemspec.email = ["matmorel@users.noreply.github.com"]
      gemspec.license = "LGPL-3.0-or-later"
      gemspec.homepage = "https://github.com/matmorel/ductr"
      # gemspec.metadata["homepage_uri"] = gemspec.homepage
      gemspec.metadata["source_code_uri"] = gemspec.homepage
      gemspec.metadata["changelog_uri"] = "#{gemspec.homepage}/releases"
      gemspec.required_ruby_version = ">= 3.1.0"
      gemspec.metadata["allowed_push_host"] = "https://rubygems.org"
      gemspec.metadata["rubygems_mfa_required"] = "true"
    end

    def add_files(gemspec, current_dir, current_file)
      # Specify which files should be added to the gem when it is released.
      # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
      gemspec.files = Dir.chdir(File.expand_path(current_dir)) do
        `git ls-files -z`.split("\x0").reject do |f|
          (f == current_file) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci|vscode)|appveyor)})
        end
      end

      gemspec.bindir = "exe"
      gemspec.executables = gemspec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
      gemspec.require_paths = ["lib"]
    end

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
