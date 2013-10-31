namespace :release do

  desc "Create all gems, including in sub-modules"
  task :gem do
    cmd = "rm -rf pkg && rake gem"
    in_each_sub_module("'rake gem' in") do |sub|
      system(cmd)
    end
    system(cmd)
  end

  desc "Try the release by installing all gems locally"
  task :try => :gem do
    cmd = "gem install --no-rdoc --no-ri --local pkg/*.gem"
    in_each_sub_module("'gem install' in") do |sub|
      system(cmd)
    end
    system(cmd)
  end

  desc "Release it!"
  task :go => :gem do
    require 'alf/version'
    version = Alf::VERSION
    cmd = "gem push pkg/*.gem && git tag v#{version} && git push origin --tags"
    in_each_sub_module("'gem push & git tag' in") do |sub|
      system(cmd)
    end
    system(cmd)
  end

end
desc "Release alf"
task :release => :"release:go"