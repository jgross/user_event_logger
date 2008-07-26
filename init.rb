require "view_helpers" 
ActionView::Base.send :include, UserEventLoggerViewHelper

ActionController::Base.send :include, UserEventLoggerMixin

path = File.join(directory, 'lib', 'models')
$LOAD_PATH << path
Dependencies.load_paths << path
Dependencies.load_once_paths.delete(path)

