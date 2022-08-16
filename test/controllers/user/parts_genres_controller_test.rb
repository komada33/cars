require "test_helper"

class User::PartsGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_parts_genres_index_url
    assert_response :success
  end

  test "should get show" do
    get user_parts_genres_show_url
    assert_response :success
  end
end
