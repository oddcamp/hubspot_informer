# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hubspot_informer/version'

Gem::Specification.new do |gem|
  gem.name          = "hubspot_informer"
  gem.version       = HubspotInformer::VERSION
  gem.authors       = ["Henrik Sjökvist"]
  gem.email         = ["henrik.sjokvist@gmail.com"]
  gem.description   = %q{A simple API wrapper for the HubSpot form submission API.}
  gem.summary       = %q{A simple API wrapper for the HubSpot form submission API. 
                         A typical use case is adding subcribers to a mailing list.}
  gem.homepage      = "http://github.com/kollegorna/hubspot_informer"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.rubyforge_project = "hubspot_informer"

  # Dependencies
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_runtime_dependency     "faraday"
end
