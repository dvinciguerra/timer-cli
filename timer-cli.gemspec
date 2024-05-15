# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'timer_cli/version'

Gem::Specification.new do |spec|
  spec.name = 'timer-cli'
  spec.version = TimerCli::VERSION
  spec.authors = ['Daniel Vinciguerra']
  spec.email = ['daniel.vinciguerra@bivee.com.br']

  spec.summary = 'timer-cli is a simple timer command line interface'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/dvinciguerra/timer-cli'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'chronic'
  spec.add_dependency 'pastel'
  spec.add_dependency 'tty-option'
  spec.add_dependency 'tty-progressbar'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
