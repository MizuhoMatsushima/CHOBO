require "test_helper"

class Public::SavingsEstinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_savings_estinations_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_savings_estinations_edit_url
    assert_response :success
  end
end
