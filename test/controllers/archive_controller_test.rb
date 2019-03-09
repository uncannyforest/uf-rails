require 'test_helper'

class ArchiveControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get archive_show_url
    assert_response :success
  end

end
