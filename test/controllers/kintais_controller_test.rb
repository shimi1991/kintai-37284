require 'test_helper'

class KintaisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kintais_index_url
    assert_response :success
  end

end
