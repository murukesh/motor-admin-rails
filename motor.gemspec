# frozen_string_literal: true

require_relative 'lib/motor/version'

Gem::Specification.new do |spec|
  spec.name        = 'motor'
  spec.version     = Motor::VERSION
  spec.authors     = ['Pete Matsyburka']
  spec.email       = ['pete.matsy@gmail.com']
  spec.summary     = 'Summary of Motor.'
  spec.description = 'Description of Motor.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.required_ruby_version = '>= 2.6'

  spec.add_dependency 'ar_lazy_preload'
  spec.add_dependency 'cancancan'
  spec.add_dependency 'js_regex'
  spec.add_development_dependency 'rubocop', '~> 1.3.1'
end
