require 'test_helper'

class ShoppingCartsControllerTest < ActionController::TestCase
  setup do
    @shopping_cart = shopping_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_cart" do
    assert_difference('ShoppingCart.count') do
      post :create, shopping_cart: { cake_required_at: @shopping_cart.cake_required_at, customer_id: @shopping_cart.customer_id, general_description_from_customer: @shopping_cart.general_description_from_customer, name_to_appear_on_cake: @shopping_cart.name_to_appear_on_cake, pay_pal_status_id: @shopping_cart.pay_pal_status_id, session_id: @shopping_cart.session_id, shopping_cart_status_id: @shopping_cart.shopping_cart_status_id, special_occasion: @shopping_cart.special_occasion, production_quotum_id: @shopping_cart.production_quotum_id }
    end

    assert_redirected_to shopping_cart_path(assigns(:shopping_cart))
  end

  test "should show shopping_cart" do
    get :show, id: @shopping_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_cart
    assert_response :success
  end

  test "should update shopping_cart" do
    put :update, id: @shopping_cart, shopping_cart: { cake_required_at: @shopping_cart.cake_required_at, customer_id: @shopping_cart.customer_id, general_description_from_customer: @shopping_cart.general_description_from_customer, name_to_appear_on_cake: @shopping_cart.name_to_appear_on_cake, pay_pal_status_id: @shopping_cart.pay_pal_status_id, session_id: @shopping_cart.session_id, shopping_cart_status_id: @shopping_cart.shopping_cart_status_id, special_occasion: @shopping_cart.special_occasion, production_quotum_id: @shopping_cart.production_quotum_id }
    assert_redirected_to shopping_cart_path(assigns(:shopping_cart))
  end

  test "should destroy shopping_cart" do
    assert_difference('ShoppingCart.count', -1) do
      delete :destroy, id: @shopping_cart
    end

    assert_redirected_to shopping_carts_path
  end
end
