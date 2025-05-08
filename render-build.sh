#!/usr/bin/env bash
set -o errexit

# Specify the desired Hugo version
HUGO_VERSION="0.128.1"

# Create directories for installation
mkdir -p "${HOME}/bin"
mkdir -p /tmp/hugo
cd /tmp/hugo

# Download and extract Hugo
wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
tar -xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

# Move Hugo to the bin directory
mv hugo "${HOME}/bin/"

# Add the bin directory to PATH
export PATH="${HOME}/bin:${PATH}"

# Return to the project directory
cd "$HOME/project/src"

# Build the site
hugo --gc --minify
