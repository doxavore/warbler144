require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# ALL of these are required for this project to run in the error scenario
require 'bundler'
require 'bundler/index'
require 'bundler/remote_specification'
require 'bundler/endpoint_specification'
require 'bundler/dep_proxy'

puts "\n----"
puts "GEM_HOME: #{ENV['GEM_HOME']}"
puts "Gem.dir: #{Gem.dir}"
puts "Gem.path:\n#{Gem.path.join("\n")}"
puts "Gemfile: #{ENV['BUNDLE_GEMFILE']}"
puts "Bundler.bundle_path: #{Bundler.bundle_path}"
puts "Bundler.root: #{Bundler.root}"
puts "Load paths:\n#{$:.join("\n")}"
puts "----\n\n"

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
