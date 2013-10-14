namespace :mod do

  SUB_MODULES = %w[
    core
    rack
    rest
    sequel
    shell
    sql
    test
  ]

  desc "Install all sub-modules"
  task :add do
    SUB_MODULES.each do |sub|
      `git submodule add git://github.com/alf-tool/alf-#{sub}.git alf-#{sub}`
    end
  end

  desc "Initialize sub-modules"
  task :init do
    `git submodule init`
  end

  desc "Update sub-modules"
  task :update do
    `git submodule update`
  end

end