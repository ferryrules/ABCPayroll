require 'test_helper'

class AdjustmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get adjustments_new_url
    assert_response :success
  end

  test "should get create" do
    get adjustments_create_url
    assert_response :success
  end

  test "should get edit" do
    get adjustments_edit_url
    assert_response :success
  end

  test "should get update" do
    get adjustments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get adjustments_destroy_url
    assert_response :success
  end

end
