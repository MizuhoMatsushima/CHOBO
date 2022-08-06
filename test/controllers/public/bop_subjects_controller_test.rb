require "test_helper"

class Public::BopSubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_bop_subjects_new_url
    assert_response :success
  end

  test "should get show" do
    get public_bop_subjects_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_bop_subjects_edit_url
    assert_response :success
  end
end
