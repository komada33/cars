require "test_helper"

class PartsGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parts_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get parts_genres_edit_url
    assert_response :success
  end
end
