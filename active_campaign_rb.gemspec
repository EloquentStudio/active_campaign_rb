# frozen_string_literal: true

require_relative "lib/active_campaign_rb/version"

Gem::Specification.new do |spec|
  spec.name          = "active_campaign_rb"
  spec.version       = ActiveCampaignRb::VERSION
  spec.authors       = ["spidergears"]
  spec.email         = ["deepak@eloquent.studio"]

  spec.summary       = "Ruby wrapper around active campaign api"
  spec.homepage      = "https://github.com/EloquentStudio/active_campaign_rb/blob/master/CHANGELOG.md"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/EloquentStudio/active_campaign_rb"
  spec.metadata["changelog_uri"] = "https://github.com/EloquentStudio/active_campaign_rb/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features|\.github|\.vscode)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 6.1"
  spec.add_dependency "faraday", "~> 1.8"
  spec.add_dependency "oj", "~> 3.13"

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.7"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
