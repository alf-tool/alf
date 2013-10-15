source 'http://rubygems.org'

group :runtime do
  gem "alf-core",   path: "./alf-core"
  gem "alf-sql",    path: "./alf-sql"
  gem "alf-shell",  path: "./alf-shell"
  gem "alf-sequel", path: "./alf-sequel"
  gem "alf-rack",   path: "./alf-rack"
end

group :test do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
  gem "sqlite3", "~> 1.3",      :platforms => ['mri', 'rbx']
  gem "jdbc-sqlite3", "~> 3.7", :platforms => ['jruby']
  gem "pg", "~> 0.14",          :platforms => ['mri', 'rbx']
  gem "alf-test",  path: "./alf-test"
end

group :release do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
end
