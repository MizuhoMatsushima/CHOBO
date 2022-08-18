require "test_helper"

class Public::SourceOfIncomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_source_of_incomes_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_source_of_incomes_edit_url
    assert_response :success
  end
end
