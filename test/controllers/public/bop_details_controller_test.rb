require "test_helper"

class Public::BopDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_bop_details_index_url
    assert_response :success
  end

  test "should get search" do
    get public_bop_details_search_url
    assert_response :success
  end
end
