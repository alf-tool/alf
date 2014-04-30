require "rspec/core/rake_task"
desc "Run rspec integration tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "spec/**/test_*.rb"
  t.rspec_opts = [
    "--color",
    "--backtrace",
    "-Ilib",
    "-Ialf-core/lib",
    "-Ialf-doc/lib",
    "-Ialf-rack/lib",
    "-Ialf-repl/lib",
    "-Ialf-sequel/lib",
    "-Ialf-shell/lib",
    "-Ialf-sql/lib",
    "-Ispec",
    "-Ifixtures/suppliers-and-parts/lib"
  ]
end
