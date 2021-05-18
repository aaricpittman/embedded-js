# frozen_string_literal: true

require_relative 'lib/embedded_js/version'

Gem::Specification.new do |spec|
  spec.name          = 'embedded_js'
  spec.version       = EmbeddedJs::VERSION
  spec.authors       = ['Aaric Pittman']
  spec.email         = ['aaricpittman@gmail.com']

  spec.summary       = 'Simplifies including JavaScript packages in your Rails Engines.'
  spec.homepage      = 'https://github.com/aaricpittman/embedded-js'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aaricpittman/embedded-js'
  spec.metadata['changelog_uri'] = 'https://github.com/aaricpittman/embedded-js/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['{lib,exe}/**/*', 'Rakefile', 'README.md']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '>= 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'solargraph'
end
