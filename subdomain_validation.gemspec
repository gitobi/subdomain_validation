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
  s.description = 'Subdomain validator for Rails application.'
  s.license     = 'MIT'

  s.files = Dir['{config,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_runtime_dependency 'rails', '~> 4.2', '>= 4.2.6'

  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.11'
  s.add_development_dependency 'rspec-rails', '~> 3.4', '>= 3.4.2'
  s.add_development_dependency 'factory_girl_rails', '~> 4.6', '>= 4.6.0'
  s.add_development_dependency 'pry-byebug', '~> 3.3', '>= 3.3.0'
end
