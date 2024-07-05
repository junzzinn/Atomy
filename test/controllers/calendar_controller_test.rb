require "test_helper"

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get authorize" do
    get calendar_authorize_url
    assert_response :success
  end

  test "should get callback" do
    get calendar_callback_url
    assert_response :success
  end

  test "should get create_event" do
    get calendar_create_event_url
    assert_response :success
  end
end
