source 'http://rubygems.org'

group :runtime do
  gem "alf-core",   :git => "git://github.com/alf-tool/alf-core.git"
  gem "alf-sql",    :git => "git://github.com/alf-tool/alf-sql.git"
  gem "alf-shell",  :git => "git://github.com/alf-tool/alf-shell.git"
  gem "alf-sequel", :git => "git://github.com/alf-tool/alf-sequel.git"
end

group :test do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
  gem "sqlite3", "~> 1.3",      :platforms => ['mri', 'rbx']
  gem "jdbc-sqlite3", "~> 3.7", :platforms => ['jruby']
  gem "pg", "~> 0.14",          :platforms => ['mri', 'rbx']
  gem "alf-test",  :git => "git://github.com/alf-tool/alf-test.git"
end

group :release do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
end
