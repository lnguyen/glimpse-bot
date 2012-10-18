lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'glimpse/bot/version'

Gem::Specification.new do |spec|
  spec.name        = 'glimpse-bot'
  spec.version     = ::Glimpse::Bot::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Long Nguyen']
  spec.email       = ['lnguyen@engineyard.com']
  spec.homepage    = 'http://engineyard.com'
  spec.summary     = 'Glimpse IRC Bot'
  spec.description = 'The glimpse IRC bot.'

  spec.required_ruby_version = '~> 1.9.3'
  spec.required_rubygems_version = '>= 1.8.23'

  spec.add_dependency 'cinch'
  spec.add_dependency 'daemons'
  spec.add_dependency 'ey_api_hmac', '>= 0.4.4'

  spec.add_development_dependency 'rake'

  spec.require_path = 'lib'
  spec.executables  = ['glimpse-bot']
  spec.files        = Dir.glob('{config,bin,lib}/**/*') + %w(README.md History.md)
end
