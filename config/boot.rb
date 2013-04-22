require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# ALL of these are required for this project to run in the error scenario
# require 'bundler'
# require 'bundler/index'
# require 'bundler/remote_specification'
# require 'bundler/endpoint_specification'
# require 'bundler/dep_proxy'

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
