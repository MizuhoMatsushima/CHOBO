require "test_helper"

class Public::DetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_details_index_url
    assert_response :success
  end

  test "should get search" do
    get public_details_search_url
    assert_response :success
  end
end
