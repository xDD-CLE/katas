# coding: utf-8
#

Gem::Specification.new do |spec|
  spec.name          = 'samjones-calculator'
  spec.version       = '0.0.2'
  spec.authors       = ['Sam Jones']
  spec.email         = ['sam@samljones.com']
  spec.summary       = 'String Calculator'
  spec.description   = 'String Calculator written for kata http://osherove.com/tdd-kata-1/'
  spec.homepage      = 'https://github.com/xDD-CLE/katas/tree/master/adder_new_lang/samjones/calculator'
  spec.license       = 'MIT'

  spec.add_dependency('rake')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec', ['>= 2.0.0'])
  spec.add_development_dependency('guard', ['>= 2.1.1'])
  spec.add_development_dependency('guard-rspec')
  spec.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end
