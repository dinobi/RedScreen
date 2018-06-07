Gem::Specification.new do |gspec|
  gspec.name = 'red_screen'
  gspec.version = '0.0.1'
  gspec.date = '2018-06-05'
  gspec.executables << 'red_screen'
  gspec.summary = 'RedScreen'
  gspec.description = %q{A mini implementation of the 'rails MVC framework'}
  gspec.authors = ['Dinobi']
  gspec.email = 'dinobi.kenkwo@andela.com'
  gspec.files = %w[
    lib/red_screen.rb
    lib/red_screen/translator.rb
    lib/red_screen/application.rb
    spec/red_screen_spec.rb
  ]
  gspec.homepage = 'http://rubygems.org/gems/red_screen'
  gspec.license = 'MIT'
  gspec.require_paths = ['lib']
  gspec.add_development_dependency 'rspec'
  gspec.add_development_dependency 'rake'
  gspec.add_development_dependency 'rdoc'
end