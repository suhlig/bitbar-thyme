# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitbar/thyme/version'

Gem::Specification.new do |spec|
  spec.name          = 'bitbar-thyme'
  spec.version       = Bitbar::Thyme::VERSION
  spec.authors       = ['Steffen Uhlig']
  spec.email         = ['steffen@familie-uhlig.net']

  spec.summary       = 'Bitbar + Thyme integration'
  spec.homepage      = 'http://github.com/suhlig/bitbar-thyme'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thyme'
  spec.add_dependency 'terminal-notifier'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'pry-byebug'
end
