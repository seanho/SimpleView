require "simple_view/version"

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  app.files += File.join(File.dirname(__FILE__), 'view_proxy.rb')
  app.files.unshift(File.join(File.dirname(__FILE__), 'simple_view/layout.rb'))
  app.files.unshift(File.join(File.dirname(__FILE__), 'simple_view/styles.rb'))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'simple_view/builders/*.rb')))
  app.files.unshift(File.join(File.dirname(__FILE__), 'simple_view/builders/ui_control_builder.rb'))
  app.files.unshift(File.join(File.dirname(__FILE__), 'simple_view/builders/ui_view_builder.rb'))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'simple_view/builders/helpers/*.rb')))
  app.files.unshift(Dir.glob(File.join(File.dirname(__FILE__), 'simple_view/extensions/*.rb')))
end