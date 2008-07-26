module UserEventLoggerMixin
  def log_user_event(name, extra_data)
    event = Event.create(:source_url => request.path,
     :remote_ip => request.remote_ip,
     :logged_at => Time.now,
     :extra_data => extra_data,
     :event_type => name
  end
end

