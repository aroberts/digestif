lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'digestif/version'

Gem::Specification.new do |s|
    s.name        = %q{digestif}
    s.version     = Digestif.version
    s.summary     = %q{Easy digest generation for large files}
    s.description = %q{Digestif lets you create fast checksums of 
        large files by skipping sections of the file.  It was created 
        with compressed media files in mind, which generally have such
        a high information density that we can get away with a checksum
        that doesn't actually consider all the bits.}

    s.files        = Dir['[A-Z]*', 'lib/**/*.rb', 'features/**/*', 'bin/**/*']
    s.require_path = 'lib'
    s.test_files   = Dir['features/**/*']

    s.default_executable = 'digestif'
    s.executables        = ['digestif']

    s.has_rdoc = false

    s.authors = ["Andrew Roberts"]
    s.email   = %q{adroberts@gmail.com}
    s.homepage = "http://github.com/aroberts/digestif"

    s.add_development_dependency('cucumber')
    s.add_development_dependency('aruba')

    s.platform = Gem::Platform::RUBY
    s.rubygems_version = %q{1.2.0}
end

