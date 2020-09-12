require_relative 'lib/coffee_drinks/version'

Gem::Specification.new do |spec|
  spec.name          = "coffee_drinks"
  spec.version       = CoffeeDrinks::VERSION
  spec.authors       = ["“saschakala”"]
  spec.email         = ["“mxsaschakala@gmail.com”"]

  spec.summary       = %q{A database of different espresso drinks and their coffee to water to milk ratios (can be viewed by whether or not the drink contains milk for the lactose conscious).}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/saschakala/coffee-drinks"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/saschakala/coffee-drinks"
  spec.metadata["changelog_uri"] = "https://github.com/saschakala/cli-project"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 0.8.1"
  spec.add_dependency "bundler", "~> 2.1.4"
  spec.add_dependency "nokogiri"
  spec.add_dependency "require_all"

  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
end
