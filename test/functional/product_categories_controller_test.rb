require 'test_helper'

class ProductCategoriesControllerTest < ActionController::TestCase
  setup do
    @product_category = product_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_category" do
    assert_difference('ProductCategory.count') do
      post :create, product_category: { description: @product_category.description, name: @product_category.name, one_choice_only: @product_category.one_choice_only, options_list_id: @product_category.options_list_id, running_order: @product_category.running_order }
    end

    assert_redirected_to product_category_path(assigns(:product_category))
  end

  test "should show product_category" do
    get :show, id: @product_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_category
    assert_response :success
  end

  test "should update product_category" do
    put :update, id: @product_category, product_category: { description: @product_category.description, name: @product_category.name, one_choice_only: @product_category.one_choice_only, options_list_id: @product_category.options_list_id, running_order: @product_category.running_order }
    assert_redirected_to product_category_path(assigns(:product_category))
  end

  test "should destroy product_category" do
    assert_difference('ProductCategory.count', -1) do
      delete :destroy, id: @product_category
    end

    assert_redirected_to product_categories_path
  end
end
