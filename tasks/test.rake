require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test" << "examples" << "lib"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
