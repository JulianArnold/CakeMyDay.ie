require 'test_helper'

class ProductionQuotaControllerTest < ActionController::TestCase
  setup do
    @production_quotum = production_quota(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_quota)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_quotum" do
    assert_difference('ProductionQuotum.count') do
      post :create, production_quotum: { finish_date: @production_quotum.finish_date, maximum_cakes_allowed: @production_quotum.maximum_cakes_allowed, start_date: @production_quotum.start_date }
    end

    assert_redirected_to production_quotum_path(assigns(:production_quotum))
  end

  test "should show production_quotum" do
    get :show, id: @production_quotum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_quotum
    assert_response :success
  end

  test "should update production_quotum" do
    put :update, id: @production_quotum, production_quotum: { finish_date: @production_quotum.finish_date, maximum_cakes_allowed: @production_quotum.maximum_cakes_allowed, start_date: @production_quotum.start_date }
    assert_redirected_to production_quotum_path(assigns(:production_quotum))
  end

  test "should destroy production_quotum" do
    assert_difference('ProductionQuotum.count', -1) do
      delete :destroy, id: @production_quotum
    end

    assert_redirected_to production_quota_path
  end
end
