require 'test_helper'

class User::MakerGenresControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get user_maker_genres_index_url
    assert_response :success
  end

  test 'should get show' do
    get user_maker_genres_show_url
    assert_response :success
  end
end
