require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# Attempted to require 'bundler' in addition to 'bundler/setup',
# but it doesn't seem to make a difference.
#   require 'bundler' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
