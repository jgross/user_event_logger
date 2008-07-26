ActiveRecord::Schema.define(:version => 0) do
  create_table :events :force => true do |t|
    t.column  :source_url, :string
    t.column  :destination_url, :string
    t.column  :remote_ip, :string
    t.column  :logged_at, :datetime
    t.column  :extra_data, :text
    t.column  :event_type, :string
  end
end
