require 'test_helper'

class SupplyUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get supply_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get supply_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get supply_users_update_url
    assert_response :success
  end

end
