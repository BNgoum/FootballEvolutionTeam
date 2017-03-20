require 'test_helper'

class JoueursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get joueurs_index_url
    assert_response :success
  end

end
