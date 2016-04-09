$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'subdomain_validation/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'subdomain_validation'
  s.version     = SubdomainValidation::VERSION
  s.authors     = ['Rui Onodera']
  s.email       = ['deraru@gmail.com']
  s.homepage    = 'https://github.com/gitobi/subdomain_validation'
  s.summary     = 'Subdomain validator for Rails'
  s.description = 'Subdomain validator for Rails'
  s.license     = 'MIT'

  s.files = Dir['{config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.2.6'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'pry-byebug'
end
