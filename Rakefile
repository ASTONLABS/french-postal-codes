require "rspec/core/rake_task"

desc "Run specs"
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.rspec_opts = %w(--color)
end

task default: [:rspec]