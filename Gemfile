source 'http://rubygems.org'

group :runtime do
  gem "alf",        path: "."
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
  gem "highline", "~> 1.6"
end

group :release do
  gem "rake", "~> 10.1"
  gem "rspec", "~> 2.14"
end

group :devel do
  gem "rack", "~> 1.5"
  gem "rack-robustness", "~> 1.1"
  gem "sinatra", "~> 1.4"
  gem "wlang", "~> 2.2"
  gem "sprockets", "~> 2.10"
end
