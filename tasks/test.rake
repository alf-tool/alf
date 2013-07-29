require "rspec/core/rake_task"
desc "Run rspec integration tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "test/**/test_*.rb"
  t.rspec_opts = ["--color", "--backtrace", "-Ilib", "-Itest"]
end
