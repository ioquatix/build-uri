# coding: utf-8
require_relative 'lib/build/uri/version'

Gem::Specification.new do |spec|
	spec.name          = "build-uri"
	spec.version       = Build::URI::VERSION
	spec.authors       = ["Samuel Williams"]
	spec.email         = ["samuel.williams@oriontransfer.co.nz"]
	spec.summary       = %q{Handle absolute URIs, triples and file paths uniformly.}
	spec.homepage      = ""
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0")
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]
	
	spec.add_development_dependency "bundler", "~> 1.3"
	spec.add_development_dependency "rspec", "~> 3.4.0"
	spec.add_development_dependency "rake"
end
