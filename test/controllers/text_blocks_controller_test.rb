require 'test_helper'

class TextBlocksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get text_blocks_new_url
    assert_response :success
  end

  test "should get create" do
    get text_blocks_create_url
    assert_response :success
  end

  test "should get update" do
    get text_blocks_update_url
    assert_response :success
  end

  test "should get edit" do
    get text_blocks_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get text_blocks_destroy_url
    assert_response :success
  end

  test "should get index" do
    get text_blocks_index_url
    assert_response :success
  end

  test "should get show" do
    get text_blocks_show_url
    assert_response :success
  end

end
