#!/usr/bin/env rake
require "bundler/gem_tasks"

$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  app.name = 'SimpleViewDemo'
  app.deployment_target = '4.3'

  app.files += Dir.glob(File.join(File.dirname(__FILE__), 'lib/simple_view/*.rb'))
  app.files.unshift(File.join(File.dirname(__FILE__), 'lib/simple_view/layout.rb'))
  app.files.unshift(File.join(File.dirname(__FILE__), 'lib/simple_view/styles.rb'))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'lib/simple_view/builders/*.rb')))
  app.files.unshift(File.join(File.dirname(__FILE__), 'lib/simple_view/builders/ui_control_builder.rb'))
  app.files.unshift(File.join(File.dirname(__FILE__), 'lib/simple_view/builders/ui_view_builder.rb'))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'lib/simple_view/builders/helpers/*.rb')))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'lib/simple_view/extensions/*.rb')))
end