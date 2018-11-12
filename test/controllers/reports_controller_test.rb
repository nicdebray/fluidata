require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reports_new_url
    assert_response :success
  end

  test "should get create" do
    get reports_create_url
    assert_response :success
  end

  test "should get update" do
    get reports_update_url
    assert_response :success
  end

  test "should get edit" do
    get reports_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get reports_destroy_url
    assert_response :success
  end

  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get show" do
    get reports_show_url
    assert_response :success
  end

end
