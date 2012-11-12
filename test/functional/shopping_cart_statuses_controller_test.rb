require 'test_helper'

class ShoppingCartStatusesControllerTest < ActionController::TestCase
  setup do
    @shopping_cart_status = shopping_cart_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_cart_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_cart_status" do
    assert_difference('ShoppingCartStatus.count') do
      post :create, shopping_cart_status: { active_cart: @shopping_cart_status.active_cart, chargeback_cart: @shopping_cart_status.chargeback_cart, description: @shopping_cart_status.description, name: @shopping_cart_status.name, paid_cart: @shopping_cart_status.paid_cart, production_complete: @shopping_cart_status.production_complete, production_started: @shopping_cart_status.production_started }
    end

    assert_redirected_to shopping_cart_status_path(assigns(:shopping_cart_status))
  end

  test "should show shopping_cart_status" do
    get :show, id: @shopping_cart_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_cart_status
    assert_response :success
  end

  test "should update shopping_cart_status" do
    put :update, id: @shopping_cart_status, shopping_cart_status: { active_cart: @shopping_cart_status.active_cart, chargeback_cart: @shopping_cart_status.chargeback_cart, description: @shopping_cart_status.description, name: @shopping_cart_status.name, paid_cart: @shopping_cart_status.paid_cart, production_complete: @shopping_cart_status.production_complete, production_started: @shopping_cart_status.production_started }
    assert_redirected_to shopping_cart_status_path(assigns(:shopping_cart_status))
  end

  test "should destroy shopping_cart_status" do
    assert_difference('ShoppingCartStatus.count', -1) do
      delete :destroy, id: @shopping_cart_status
    end

    assert_redirected_to shopping_cart_statuses_path
  end
end
