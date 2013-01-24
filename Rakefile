#!/usr/bin/env rake
require "bundler/gem_tasks"

$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  app.name = 'SimpleViewDemo'
  app.deployment_target = '5.0'

  app.files += Dir.glob(File.join(File.dirname(__FILE__), 'lib/simple_view/*.rb'))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'lib/simple_view/extensions/*.rb')))
end