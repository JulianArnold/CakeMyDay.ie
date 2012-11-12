require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { allow_user_to_choose_quantity: @product.allow_user_to_choose_quantity, allow_user_to_enter_description: @product.allow_user_to_enter_description, created_by: @product.created_by, description: @product.description, name: @product.name, options_list_id: @product.options_list_id, pre_configured_product: @product.pre_configured_product, product_category_id: @product.product_category_id, production_quota_value: @product.production_quota_value, running_order: @product.running_order, special_occasion_id: @product.special_occasion_id, updated_by: @product.updated_by }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { allow_user_to_choose_quantity: @product.allow_user_to_choose_quantity, allow_user_to_enter_description: @product.allow_user_to_enter_description, created_by: @product.created_by, description: @product.description, name: @product.name, options_list_id: @product.options_list_id, pre_configured_product: @product.pre_configured_product, product_category_id: @product.product_category_id, production_quota_value: @product.production_quota_value, running_order: @product.running_order, special_occasion_id: @product.special_occasion_id, updated_by: @product.updated_by }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
