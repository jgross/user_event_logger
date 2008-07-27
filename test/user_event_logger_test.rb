require File.dirname(__FILE__) + '/test_helper.rb'
require 'test/unit'
require 'rubygems'
require 'mocha'

class UserEventLoggerTest < Test::Unit::TestCase
  def setup
    @controller = ActionController::Base.new
    r = mock('request')
    r.stubs(:path).returns("the path")
    r.stubs(:remote_ip).returns("the remote IP")
    @controller.stubs(:request).returns(r)
  end
  
  def get_last_event
    Event.find(:first, :order => "id DESC")
  end
  
  def test_log_user_event
    @controller.log_user_event "the name", "the destination URL", "the extra data"
    e = get_last_event
    assert_equal "the path", e.source_url
    assert_equal "the destination URL", e.destination_url
    assert_equal "the name", e.event_type
    assert_equal "the remote IP", e.remote_ip
    assert_equal "the extra data", e.extra_data
    assert_equal "the name", e.event_type
  end

  def test_log_user_event_with_defaults
    @controller.log_user_event "the name"
    e = get_last_event
    assert_equal "the path", e.source_url
    assert_equal nil, e.destination_url
    assert_equal "the name", e.event_type
    assert_equal "the remote IP", e.remote_ip
    assert_equal nil, e.extra_data
    assert_equal "the name", e.event_type
  end
end

