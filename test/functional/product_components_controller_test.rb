require 'test_helper'

class ProductComponentsControllerTest < ActionController::TestCase
  setup do
    @product_component = product_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_component" do
    assert_difference('ProductComponent.count') do
      post :create, product_component: { component_product_id: @product_component.component_product_id, product_id: @product_component.product_id, quantity: @product_component.quantity, running_order: @product_component.running_order }
    end

    assert_redirected_to product_component_path(assigns(:product_component))
  end

  test "should show product_component" do
    get :show, id: @product_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_component
    assert_response :success
  end

  test "should update product_component" do
    put :update, id: @product_component, product_component: { component_product_id: @product_component.component_product_id, product_id: @product_component.product_id, quantity: @product_component.quantity, running_order: @product_component.running_order }
    assert_redirected_to product_component_path(assigns(:product_component))
  end

  test "should destroy product_component" do
    assert_difference('ProductComponent.count', -1) do
      delete :destroy, id: @product_component
    end

    assert_redirected_to product_components_path
  end
end
