#!/usr/bin/env rake
require 'bundler/setup';
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

Bundler.setup(:default, :development)
RSpec::Core::RakeTask.new(:spec)

task :default => :spec
