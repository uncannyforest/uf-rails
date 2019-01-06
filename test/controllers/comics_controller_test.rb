require 'test_helper'

class ComicsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get comics_show_url
    assert_response :success
  end

end
