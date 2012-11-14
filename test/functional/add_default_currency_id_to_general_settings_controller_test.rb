require 'test_helper'

class AddDefaultCurrencyIdToGeneralSettingsControllerTest < ActionController::TestCase
  setup do
    @add_default_currency_id_to_general_setting = add_default_currency_id_to_general_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_default_currency_id_to_general_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_default_currency_id_to_general_setting" do
    assert_difference('AddDefaultCurrencyIdToGeneralSetting.count') do
      post :create, add_default_currency_id_to_general_setting: { default_currency_id: @add_default_currency_id_to_general_setting.default_currency_id }
    end

    assert_redirected_to add_default_currency_id_to_general_setting_path(assigns(:add_default_currency_id_to_general_setting))
  end

  test "should show add_default_currency_id_to_general_setting" do
    get :show, id: @add_default_currency_id_to_general_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_default_currency_id_to_general_setting
    assert_response :success
  end

  test "should update add_default_currency_id_to_general_setting" do
    put :update, id: @add_default_currency_id_to_general_setting, add_default_currency_id_to_general_setting: { default_currency_id: @add_default_currency_id_to_general_setting.default_currency_id }
    assert_redirected_to add_default_currency_id_to_general_setting_path(assigns(:add_default_currency_id_to_general_setting))
  end

  test "should destroy add_default_currency_id_to_general_setting" do
    assert_difference('AddDefaultCurrencyIdToGeneralSetting.count', -1) do
      delete :destroy, id: @add_default_currency_id_to_general_setting
    end

    assert_redirected_to add_default_currency_id_to_general_settings_path
  end
end
