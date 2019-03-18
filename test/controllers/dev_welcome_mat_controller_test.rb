require 'test_helper'

class DevWelcomeMatControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dev_welcome_mat_show_url
    assert_response :success
  end

end
