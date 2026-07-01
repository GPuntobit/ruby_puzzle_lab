require "test_helper"

class UserProgressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_progresses_index_url
    assert_response :success
  end
end
