require_relative "lib/yawl/version"

Gem::Specification.new do |spec|
  spec.name = "yawl"
  spec.version = Yawl::VERSION
  spec.authors = ["Edulib France"]
  spec.email = ["technique@edulib.fr"]
  spec.homepage = "https://github.com/edulib/yawl"
  spec.summary = "Summary of Yawl."
  spec.description = "Description of Yawl."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/edulib/yawl"
  spec.metadata["changelog_uri"] = "https://github.com/edulib/yawl/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2.1"
  spec.add_dependency "ahoy_matey", ">= 5.0.0"

  spec.add_development_dependency "rspec-rails", "~> 8.0"
  spec.add_development_dependency "standard", "~> 1.50"
end
