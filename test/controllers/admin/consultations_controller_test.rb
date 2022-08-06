require "test_helper"

class Admin::ConsultationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_consultations_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_consultations_show_url
    assert_response :success
  end

  test "should get search" do
    get admin_consultations_search_url
    assert_response :success
  end
end
