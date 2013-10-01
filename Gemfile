source 'http://rubygems.org'

group :runtime do
  gem "alf-core",   "~> 0.14.0"
  gem "alf-sequel", "~> 0.14.0"
  gem "alf-shell",  "~> 0.14.0"
end

group :test do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
  gem "sqlite3", "~> 1.3",      :platforms => ['mri', 'rbx']
  gem "jdbc-sqlite3", "~> 3.7", :platforms => ['jruby']
  gem "pg", "~> 0.14",          :platforms => ['mri', 'rbx']
end

group :release do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
end
