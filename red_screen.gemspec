# coding: utf-8

lib = File.expand_path('/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gspec|
  gspec.name = 'red_screen'
  gspec.version = '0.0.1'
  gspec.date = '2018-06-05'
  gspec.executables << 'red_screen'
  gspec.summary = 'RedScreen'
  gspec.description = %q{A mini implementation of the 'rails MVC framework'}
  gspec.authors = ['Dinobi']
  gspec.email = 'dinobi.kenkwo@andela.com'
  gspec.files = `git ls-files`.split($/)
  gspec.homepage = 'http://rubygems.org/gems/red_screen'
  gspec.license = 'MIT'
  gspec.require_paths = ['lib']

  gspec.add_development_dependency 'rspec'
  gspec.add_development_dependency 'rake'
  gspec.add_development_dependency 'rdoc'

  gspec.add_runtime_dependency 'tilt'
  gspec.add_runtime_dependency 'rack'
end