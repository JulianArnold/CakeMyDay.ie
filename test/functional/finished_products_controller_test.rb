require 'test_helper'

class FinishedProductsControllerTest < ActionController::TestCase
  setup do
    @finished_product = finished_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finished_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finished_product" do
    assert_difference('FinishedProduct.count') do
      post :create, finished_product: { available_for_purchase: @finished_product.available_for_purchase, description: @finished_product.description, product_name: @finished_product.product_name, running_order: @finished_product.running_order, special_occasion_id: @finished_product.special_occasion_id, typical_price: @finished_product.typical_price, visible: @finished_product.visible }
    end

    assert_redirected_to finished_product_path(assigns(:finished_product))
  end

  test "should show finished_product" do
    get :show, id: @finished_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finished_product
    assert_response :success
  end

  test "should update finished_product" do
    put :update, id: @finished_product, finished_product: { available_for_purchase: @finished_product.available_for_purchase, description: @finished_product.description, product_name: @finished_product.product_name, running_order: @finished_product.running_order, special_occasion_id: @finished_product.special_occasion_id, typical_price: @finished_product.typical_price, visible: @finished_product.visible }
    assert_redirected_to finished_product_path(assigns(:finished_product))
  end

  test "should destroy finished_product" do
    assert_difference('FinishedProduct.count', -1) do
      delete :destroy, id: @finished_product
    end

    assert_redirected_to finished_products_path
  end
end
