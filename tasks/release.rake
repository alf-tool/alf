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