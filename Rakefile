$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

Motion::Project::App.setup do |app|
  app.name = 'SimpleView'
  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))
  app.files_dependencies 'lib/builders/ui_activity_indicator_view_builder.rb' => 'lib/builders/ui_view_builder.rb'
  app.files_dependencies 'lib/builders/ui_control_builder.rb' => 'lib/builders/ui_view_builder.rb'
  app.files_dependencies 'lib/builders/ui_button_builder.rb' => 'lib/builders/ui_control_builder.rb'
end
