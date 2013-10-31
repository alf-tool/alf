# We run tests by default
task :default => :test

SUB_MODULES = %w[
  core
  sql
  sequel
  shell
  rack
  doc
  rest
]

#
# Install all tasks found in tasks folder
#
# See .rake files there for complete documentation.
#
Dir["tasks/*.rake"].each do |taskfile|
  load taskfile
end
