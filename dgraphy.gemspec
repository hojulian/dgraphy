
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dgraphy/version"

Gem::Specification.new do |spec|
  spec.name          = "dgraphy"
  spec.version       = Dgraphy::VERSION
  spec.authors       = ["Julian Ho"]
  spec.email         = ["sscj2010@gmail.com"]

  spec.summary       = %q{Dgraphy for ruby}
  spec.description   = %q{dgraphy is a simple dgraph client that communicates with dgraph via http.}
  spec.homepage      = "https://github.com/xumr0x/dgraphy"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "https://github.com/xumr0x/dgraphy"
  #
  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "https://github.com/xumr0x/dgraphy"
  #   spec.metadata["changelog_uri"] = "https://github.com/xumr0x/dgraphy"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
