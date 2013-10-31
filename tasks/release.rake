namespace :release do

  desc "Create gems in each sub-module"
  task :gem do
    Bundler.with_clean_env do
      SUB_MODULES.each do |sub|
        puts "Running rake gem in #{sub}"
        system "cd alf-#{sub} && rm -rf pkg && rake gem"
      end
      system "rake gem"
    end
  end

  task :try => :gem do
    Bundler.with_clean_env do
      SUB_MODULES.each do |sub|
        puts "Installing gem from #{sub}"
        system "cd alf-#{sub} && gem install --no-rdoc --no-ri --local pkg/*.gem"
      end
      system "gem install --no-rdoc --no-ri --local pkg/*.gem"
    end
  end

end