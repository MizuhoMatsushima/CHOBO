require "test_helper"

class Public::ConsultationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_consultations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_consultations_show_url
    assert_response :success
  end

  test "should get new" do
    get public_consultations_new_url
    assert_response :success
  end

  test "should get own_index" do
    get public_consultations_own_index_url
    assert_response :success
  end
end
