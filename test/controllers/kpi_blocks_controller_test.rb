require 'test_helper'

class KpiBlocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kpi_blocks_index_url
    assert_response :success
  end

  test "should get show" do
    get kpi_blocks_show_url
    assert_response :success
  end

  test "should get new" do
    get kpi_blocks_new_url
    assert_response :success
  end

  test "should get create" do
    get kpi_blocks_create_url
    assert_response :success
  end

  test "should get update" do
    get kpi_blocks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get kpi_blocks_destroy_url
    assert_response :success
  end

end
