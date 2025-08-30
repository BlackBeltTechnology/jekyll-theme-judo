# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-judo"
  spec.version       = "0.1.0"
  spec.summary       = "A clean, enterprise-style Jekyll theme inspired by judo.codes"
  spec.authors       = ["Your Name"]
  spec.email         = ["you@example.com"]
  spec.files         = Dir.glob("**/*") - Dir.glob("example/**/*")
  spec.homepage      = "https://github.com/YOUR_GITHUB_USERNAME/jekyll-theme-judo"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.add_runtime_dependency "jekyll", ">= 3.9", "< 5.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.8"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"
end
