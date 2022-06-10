# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "algorithm/version"

Gem::Specification.new do |spec|
  spec.name          = "algorithm-ruby"
  spec.version       = Algorithm::VERSION
  spec.authors       = ["siman-man"]
  spec.email         = ["tmshuichi@gmail.com"]

  spec.summary       = %q{algorithm library}
  spec.description   = %q{algorithm library}
  spec.homepage      = "https://github.com/siman-man/algorithm-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "prime"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
