namespace :mod do

  desc "Install all sub-modules"
  task :add do
    SUB_MODULES.each do |sub|
      `git submodule add git@github.com:alf-tool/alf-#{sub}.git alf-#{sub}`
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

  desc "Pull from origin on every sub-modules"
  task :pull do
    SUB_MODULES.each do |sub|
      puts "Refreshing #{sub}"
      system "cd alf-#{sub} && git pull origin"
    end
  end

  desc "Push to origin on every sub-modules"
  task :push do
    SUB_MODULES.each do |sub|
      puts "Pushing #{sub}"
      system "cd alf-#{sub} && git push origin"
    end
  end

  desc "Run bundle-update on each submodule"
  task :"bundle-update" do
    SUB_MODULES.each do |sub|
      Bundler.with_clean_env do
        puts "Running bundle in #{sub}"
        system "cd alf-#{sub} && bundle update"
        system "cd alf-#{sub} && BUNDLE_GEMFILE=Gemfile.ci bundle update"
      end
    end
  end

  desc "Run bundle-install on each submodule"
  task :bundle do
    SUB_MODULES.each do |sub|
      Bundler.with_clean_env do
        puts "Running bundle in #{sub}"
        system "cd alf-#{sub} && bundle install"
        system "cd alf-#{sub} && BUNDLE_GEMFILE=Gemfile.ci bundle install"
      end
    end
  end

  desc "Test sub-modules"
  task :test do
    SUB_MODULES.each do |sub|
      Bundler.with_clean_env do
        puts "Running tests in #{sub}"
        system "cd alf-#{sub} && bundle exec rake"
      end
    end
  end

end