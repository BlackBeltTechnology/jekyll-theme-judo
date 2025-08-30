#!/bin/bash

# Script to serve the jekyll-theme-judo example site locally
# This script handles bundle installation and serves the example site

set -e

echo "🎯 Starting jekyll-theme-judo example server..."

# Check if we're in the correct directory
if [ ! -f "jekyll-theme-judo.gemspec" ]; then
    echo "❌ Error: Please run this script from the jekyll-theme-judo root directory"
    exit 1
fi

# Install theme dependencies first
echo "📦 Installing theme dependencies..."
bundle install

# Navigate to example directory
cd example

# Install example dependencies
echo "📦 Installing example site dependencies..."
bundle install

# Clean any previous builds
echo "🧹 Cleaning previous builds..."
bundle exec jekyll clean

# Serve the site
echo "🚀 Starting Jekyll server..."
echo "📍 Site will be available at: http://localhost:4000"
echo "⏹️  Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --livereload --open-url