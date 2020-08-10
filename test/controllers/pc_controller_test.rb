require 'test_helper'

class PcControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pc_index_url
    assert_response :success
  end

end
