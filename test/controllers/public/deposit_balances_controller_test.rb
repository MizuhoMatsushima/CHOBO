require "test_helper"

class Public::DepositBalancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_deposit_balances_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_deposit_balances_edit_url
    assert_response :success
  end
end
