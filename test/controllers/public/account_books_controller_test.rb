require "test_helper"

class Public::AccountBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_account_books_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_account_books_edit_url
    assert_response :success
  end
end
