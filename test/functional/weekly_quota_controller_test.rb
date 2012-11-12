require 'test_helper'

class WeeklyQuotaControllerTest < ActionController::TestCase
  setup do
    @weekly_quotum = weekly_quota(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weekly_quota)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weekly_quotum" do
    assert_difference('WeeklyQuotum.count') do
      post :create, weekly_quotum: { created_by: @weekly_quotum.created_by, end_date: @weekly_quotum.end_date, quota: @weekly_quotum.quota, start_date: @weekly_quotum.start_date, updated_by: @weekly_quotum.updated_by }
    end

    assert_redirected_to weekly_quotum_path(assigns(:weekly_quotum))
  end

  test "should show weekly_quotum" do
    get :show, id: @weekly_quotum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weekly_quotum
    assert_response :success
  end

  test "should update weekly_quotum" do
    put :update, id: @weekly_quotum, weekly_quotum: { created_by: @weekly_quotum.created_by, end_date: @weekly_quotum.end_date, quota: @weekly_quotum.quota, start_date: @weekly_quotum.start_date, updated_by: @weekly_quotum.updated_by }
    assert_redirected_to weekly_quotum_path(assigns(:weekly_quotum))
  end

  test "should destroy weekly_quotum" do
    assert_difference('WeeklyQuotum.count', -1) do
      delete :destroy, id: @weekly_quotum
    end

    assert_redirected_to weekly_quota_path
  end
end
