require "test_helper"

class GolfcoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get golfcourses_new_url
    assert_response :success
  end

  test "should get index" do
    get golfcourses_index_url
    assert_response :success
  end

  test "should get show" do
    get golfcourses_show_url
    assert_response :success
  end

  test "should get edit" do
    get golfcourses_edit_url
    assert_response :success
  end
end
