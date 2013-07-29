source 'http://rubygems.org'

group :runtime do
  # gem "alf-core",   path: "../alf-core"
  # gem "alf-sequel", path: "../alf-sequel"
  # gem "alf-shell",  path: "../alf-shell"
  # gem "alf-core",   git: "git://github.com/alf-tool/alf-core.git"
  # gem "alf-sequel", git: "git://github.com/alf-tool/alf-sequel.git"
  # gem "alf-shell",  git: "git://github.com/alf-tool/alf-shell.git"
  gem "alf-core", "~> 0.13.0"
  gem "alf-sequel", "~> 0.13.0"
  gem "alf-shell", "~> 0.13.0"
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
