require "view_helpers" 
require "user_event_logger"
ActionView::Base.send :include, UserEventLogger::UserEventLoggerViewHelper
ActionController::Base.send :include, UserEventLogger::UserEventLoggerMixin

path = File.join(directory, 'lib', 'models')
$LOAD_PATH << path
Dependencies.load_paths << path
Dependencies.load_once_paths.delete(path)

