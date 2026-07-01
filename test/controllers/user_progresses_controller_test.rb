require "test_helper"

class UserProgressesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    user = User.create!(email: "s9457558@outlook.it", password: "d9KVUv9!WGA0ZpgK", password_confirmation: "d9KVUv9!WGA0ZpgK")
    sign_in user
    get user_progresses_url
    assert_response :success
  end
end
