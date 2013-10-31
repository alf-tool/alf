namespace :mod do

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
    in_each_sub_module("Refreshing") do |sub|
      system "git pull origin"
    end
  end

  desc "Push to origin on every sub-modules"
  task :push do
    in_each_sub_module("Pushing") do |sub|
      system "git push origin"
    end
  end

  desc "Run bundle-update on each submodule"
  task :"bundle-update" do
    in_each_sub_module("'bundle update' in") do |sub|
      system "bundle update"
      system "BUNDLE_GEMFILE=Gemfile.ci bundle update"
    end
  end

  desc "Run bundle-install on each submodule"
  task :bundle do
    in_each_sub_module("'bundle install' in") do |sub|
      system "bundle install"
      system "BUNDLE_GEMFILE=Gemfile.ci bundle install"
    end
  end

  desc "Test sub-modules"
  task :test do
    in_each_sub_module("Test") do |sub|
      system "bundle exec rake"
    end
  end

end