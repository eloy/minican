lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minican/version'

Gem::Specification.new do |spec|
  spec.name          = "minican"
  spec.version       = Minican::VERSION
  spec.authors       = ["Eloy Gomez"]
  spec.email         = ["eloy@indeos.es"]

  spec.summary       = %q{Simple gem to manage permissions}
  spec.homepage      = "https://github.com/eloy/minican"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
