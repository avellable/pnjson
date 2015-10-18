# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pnjson/version'

Gem::Specification.new do |s|
  s.name    = 'pnjson'

  # Do not change the version and date fields by hand. This will be done
  # automatically by the gem release script.
  s.version = Pnjson::VERSION

  s.summary     = "Pure ruby library for converting png images to json."
  s.description = "Pure ruby library for converting png images to json."

  s.authors  = ['Mahesh Baheti']
  s.email    = ['mahsh.baheti@gmail.com']
  s.homepage = 'http://www.github.com/avellable/pnjson'
  s.license  = 'MIT'

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 3')

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
end
