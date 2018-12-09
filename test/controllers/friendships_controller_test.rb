require 'test_helper'

class FiendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get fiendships_destroy_url
    assert_response :success
  end

end
