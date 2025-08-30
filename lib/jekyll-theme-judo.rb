# frozen_string_literal: true
require "jekyll"
require "jekyll-seo-tag"
require "jekyll-sitemap"

module JekyllThemeJudo
  class Generator < Jekyll::Generator
    priority :low
    def generate(site); end
  end
end
