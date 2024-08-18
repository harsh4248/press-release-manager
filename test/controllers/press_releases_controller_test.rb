require "test_helper"

class PressReleasesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get press_releases_new_url
    assert_response :success
  end

  test "should get create" do
    get press_releases_create_url
    assert_response :success
  end

  test "should get edit" do
    get press_releases_edit_url
    assert_response :success
  end

  test "should get update" do
    get press_releases_update_url
    assert_response :success
  end

  test "should get destroy" do
    get press_releases_destroy_url
    assert_response :success
  end
end
