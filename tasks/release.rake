namespace :release do

  desc "Bump the version number"
  task :bump, :to do |t, args|
    require 'path'
    raise "Missing version number" unless to = args[:to]
    in_each_sub_module("bump to #{to}") do |sub|
      noespec = Path("alf-#{sub}.noespec")
      content = noespec.read.gsub(/^  version:\n    (.*?)\n/){|x|
        "  version:\n    #{to}\n"
      }
      noespec.write(content)
      system("noe go -s")
      system("git commit -a -m 'Bump version to #{to}'")
    end
  end

  desc "Set the CHANGELOG 'FIX ME' to the current date"
  task :stamp do
    require 'time'
    require 'path'
    require 'alf/version'
    date = Time.now.strftime("%Y-%m-%d")
    version = Alf::VERSION
    cmd = "git commit -a -m 'Releasing #{version}'"
    doit = ->{
      clog = Path('CHANGELOG.md')
      clog.write clog.read.gsub(/FIX ME/, date)
      system(cmd)
    }
    in_each_sub_module("stamping CHANGELOG in") do |sub|
      doit.call
    end
    doit.call
  end

  desc "Tag the version and push everything"
  task :tag => :stamp do
    require 'alf/version'
    version = Alf::VERSION
    cmd = "git tag v#{version} && git push origin master --tags"
    in_each_sub_module("'git tag and push' in") do |sub|
      system(cmd)
    end
  end

  desc "Create all gems, including in sub-modules"
  task :gem => :doc do
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

  desc "Push the release just done!"
  task :push do
    cmd = "gem push pkg/*.gem"
    in_each_sub_module("'gem push in") do |sub|
      system(cmd)
    end
    system(cmd)
  end

  desc "Release it!"
  task :go => [:tag, :gem, :push]

end
desc "Release alf"
task :release => :"release:go"