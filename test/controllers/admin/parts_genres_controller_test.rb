require 'test_helper'

class Admin::PartsGenresControllerTest < ActionDispatch::IntegrationTest
  test 'should get edit' do
    get admin_parts_genres_edit_url
    assert_response :success
  end

  test 'should get index' do
    get admin_parts_genres_index_url
    assert_response :success
  end
end
