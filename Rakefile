# We run tests by default
task :default => :test

SUB_MODULES = %w[
  core
  sql
  sequel
  shell
  rack
  repl
  doc
  rest
]

def clean_env(&bl)
  Bundler.with_clean_env(&bl)
end

def in_each_sub_module(msg)
  clean_env do
    SUB_MODULES.each do |sub|
      chdir("alf-#{sub}") do
        puts "#{msg} #{sub}"
        yield(sub)
      end
    end
  end
end

#
# Install all tasks found in tasks folder
#
# See .rake files there for complete documentation.
#
Dir["tasks/*.rake"].each do |taskfile|
  load taskfile
end
