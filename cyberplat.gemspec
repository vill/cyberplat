# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cyberplat/version'

Gem::Specification.new do |spec|
  spec.name          = 'cyberplat'
  spec.version       = CyberPlat::VERSION
  spec.authors       = ['Aleksandr Grigorev']
  spec.email         = ['vill@weblayout.ru']

  spec.summary       = %q{Ruby клиент для работы с API платежной системы КиберПлат.}
  spec.description   = %q{Ruby клиент для работы с API платежной системы КиберПлат.}
  spec.homepage      = 'https://github.com/vill/cyberplat.git'
  spec.license       = 'MIT'

  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.required_ruby_version     = '>= 2.0.0'
  spec.required_rubygems_version = '>= 2.2.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0'
end
