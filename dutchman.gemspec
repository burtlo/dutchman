# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dutchman/version'

Gem::Specification.new do |spec|
  spec.name          = "dutchman"
  spec.version       = Dutchman::VERSION
  spec.authors       = ["Franklin Webber"]
  spec.email         = ["franklin.webber@gmail.com"]
  spec.summary       = %q{A an interface to have your computer do the automated type (OSX only).}
  spec.description   = %q{Imagine you are writing a screencast and wanted to save yourself the
embarassment of all those typos, the viewers the discomfort of watching you
fumble, or all the hours you are going to spend mind-numblingly slicing and
splicing the recording.}
  spec.homepage      = "https://github.com/burtlo/dutchman"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
