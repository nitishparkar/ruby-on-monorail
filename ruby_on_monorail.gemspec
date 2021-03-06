# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_on_monorail/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_on_monorail"
  spec.version       = RubyOnMonorail::VERSION
  spec.authors       = ["Nitish Parkar"]
  spec.email         = ["developer.nitish@gmail.com"]

  spec.summary       = %q{A Rack-based framework}
  spec.description   = %q{A Rack-based framework for understanding rails internals}
  spec.homepage      = "https://github.com/nitishparkar/ruby_on_monorail"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "rack", "~> 2.0"
  spec.add_runtime_dependency "erubis", "~> 2.7"
  spec.add_development_dependency "rack-test", "~> 0.6.3"
  spec.add_development_dependency "test-unit", "~> 3.1"
  spec.add_development_dependency "pry", "~> 0.10.3"
end
