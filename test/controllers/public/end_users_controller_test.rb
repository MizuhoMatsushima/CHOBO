require "test_helper"

class Public::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_end_users_top_url
    assert_response :success
  end

  test "should get show" do
    get public_end_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_end_users_edit_url
    assert_response :success
  end

  test "should get confirm" do
    get public_end_users_confirm_url
    assert_response :success
  end

  test "should get search" do
    get public_end_users_search_url
    assert_response :success
  end
end
