# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

require "sord"

desc "Generates RBS file from the yard documentation"
task :sord do
  options = {
    rbs: true,
    sord_comments: true,
    regenerate: true,
    break_params: 4,
    replace_errors_with_untyped: false,
    replace_unresolved_with_untyped: false,
    hide_private: false,
    exclude_messages: nil,
    include_messages: nil,
    keep_original_comments: false,
    skip_constants: false,
    use_original_initialize_return: false,
    exclude_untyped: false,
    tags: []
  }

  plugin = Sord::ParlourPlugin.new(options)
  plugin.parlour = Parlour::RbsGenerator.new(break_params: options[:break_params])
  plugin.generate(plugin.parlour.root)

  File.write("sig/ductr/postgres.rbs", plugin.parlour.send(:rbs))
end
