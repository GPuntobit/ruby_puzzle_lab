require "test_helper"

class LevelsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    user = User.create!(email: "levels_index@example.com", password: "d9KVUv9!WGA0ZpgK", password_confirmation: "d9KVUv9!WGA0ZpgK")
    sign_in user
    get levels_path
    assert_response :success
  end

  test "should show an answer input field on the level page" do
    user = User.create!(email: "levels_show@example.com", password: "d9KVUv9!WGA0ZpgK", password_confirmation: "d9KVUv9!WGA0ZpgK")
    level = Level.create!(title: "Livello prova", description: "Prova", level_type: "drag-and-drop", solution: "puts 'ciao'")
    level.blocks.create!(content: "puts")
    level.blocks.create!(content: "'ciao'")

    sign_in user
    get level_path(level)

    assert_response :success
    assert_select "textarea#answer-input"
  end
end
