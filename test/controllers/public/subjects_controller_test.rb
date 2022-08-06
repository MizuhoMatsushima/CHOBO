require "test_helper"

class Public::SubjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_subjects_new_url
    assert_response :success
  end

  test "should get index" do
    get public_subjects_index_url
    assert_response :success
  end
end
