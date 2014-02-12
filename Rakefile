require 'rubygems'

task :default => [:help]

desc "Check puppet manifests with puppet-lint"
task :lint do
  require 'puppet-lint/tasks/puppet-lint'

  # we don't control what is in "shared/*" or the fixtures
  PuppetLint.configuration.ignore_paths = [/spec\/fixtures/, /^shared\//]

  PuppetLint.configuration.send("disable_80chars")
end


desc "Check puppet manifest syntax"
task :syntax do
  require 'puppet/face'
  parser = Puppet::Face['parser', :current]

  RakeFileUtils.send(:verbose, true) do
    matched_files = FileList['**/*.pp'].exclude(/spec\/fixtures/, /^shared\//)

    matched_files.to_a.each do |puppet_file|
      parser.validate(puppet_file)
    end
  end
end


desc "Run tests and static checks"
task :check => [:syntax, :lint]


desc "Run tests in the modules"
task :spec do
  matched_files = FileList['modules/**/Rakefile'].exclude(/spec\/fixtures/, /^shared\//)

  matched_files.to_a.each do |rake_file|
    puts "rakefile: #{rake_file} in #{File.dirname(rake_file)}"
    system("cd #{File.dirname(rake_file)} ; rake -f Rakefile spec")
  end
end


desc "Display the list of available rake tasks"
task :help do
  system("rake -T")
end
