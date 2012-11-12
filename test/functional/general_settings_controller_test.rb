require 'test_helper'

class GeneralSettingsControllerTest < ActionController::TestCase
  setup do
    @general_setting = general_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:general_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create general_setting" do
    assert_difference('GeneralSetting.count') do
      post :create, general_setting: { aws_bucket_name: @general_setting.aws_bucket_name, customer_service_email_address: @general_setting.customer_service_email_address, customer_service_phone_number: @general_setting.customer_service_phone_number, default_value_for_weekly_production_quota: @general_setting.default_value_for_weekly_production_quota, rbn_number: @general_setting.rbn_number }
    end

    assert_redirected_to general_setting_path(assigns(:general_setting))
  end

  test "should show general_setting" do
    get :show, id: @general_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @general_setting
    assert_response :success
  end

  test "should update general_setting" do
    put :update, id: @general_setting, general_setting: { aws_bucket_name: @general_setting.aws_bucket_name, customer_service_email_address: @general_setting.customer_service_email_address, customer_service_phone_number: @general_setting.customer_service_phone_number, default_value_for_weekly_production_quota: @general_setting.default_value_for_weekly_production_quota, rbn_number: @general_setting.rbn_number }
    assert_redirected_to general_setting_path(assigns(:general_setting))
  end

  test "should destroy general_setting" do
    assert_difference('GeneralSetting.count', -1) do
      delete :destroy, id: @general_setting
    end

    assert_redirected_to general_settings_path
  end
end
