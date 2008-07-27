module UserEventLogger
  module UserEventLoggerViewHelper
    def log_user_event(name, destination_url = nil, extra_data = nil)
      returning "" do |result|
        event = Event.create(:source_url => request.path,
         :destination_url => destination_url,
         :remote_ip => request.remote_ip,
         :logged_at => Time.now,
         :extra_data => extra_data,
         :event_type => name
        )
      end
    end
  end
end