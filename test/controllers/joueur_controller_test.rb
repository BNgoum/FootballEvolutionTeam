require 'test_helper'

class JoueurControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get joueur_index_url
    assert_response :success
  end

end
