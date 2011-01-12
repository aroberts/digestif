require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rake/gempackagetask'

desc 'Default: run the cucumber features.'
task :default => :features

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

eval("$specification = begin; #{IO.read('digestif.gemspec')}; end")
Rake::GemPackageTask.new($specification) do |package|
  package.need_zip = true
  package.need_tar = true
end
