
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reserved_subdomains/version"

Gem::Specification.new do |spec|
  spec.name          = "reserved_subdomains"
  spec.version       = ReservedSubdomains::VERSION
  spec.authors       = ["Clayton Lengel-Zigich"]
  spec.email         = ["reserved_subdomains@me.claytonlz.com"]

  spec.summary       = %q{Custom Active Record validator for reserved subdomains.}
  spec.description   = %q{A custom Active Record validator that helps you prevent users from signing up for multi-tenant style systems with reserved subdomains like www, ftp, mail, stmp, etc.}
  spec.homepage      = "https://github.com/clayton/reserved_subdomains"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", "~> 6.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
