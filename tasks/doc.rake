desc "Ensure documentation is synchronized"
task :doc do
  ["alf-doc", "alf-shell", "../try-alf"].each do |dir|
    clean_env do
      chdir(dir) do
        system("rake doc")
      end
    end
  end
end