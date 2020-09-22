require 'test_helper'

class DemandUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get demand_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get demand_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get demand_users_update_url
    assert_response :success
  end

end
