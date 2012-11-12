require 'test_helper'

class SpecialOccasionsControllerTest < ActionController::TestCase
  setup do
    @special_occasion = special_occasions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:special_occasions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create special_occasion" do
    assert_difference('SpecialOccasion.count') do
      post :create, special_occasion: { name: @special_occasion.name, running_order: @special_occasion.running_order, visible_to_customers: @special_occasion.visible_to_customers }
    end

    assert_redirected_to special_occasion_path(assigns(:special_occasion))
  end

  test "should show special_occasion" do
    get :show, id: @special_occasion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @special_occasion
    assert_response :success
  end

  test "should update special_occasion" do
    put :update, id: @special_occasion, special_occasion: { name: @special_occasion.name, running_order: @special_occasion.running_order, visible_to_customers: @special_occasion.visible_to_customers }
    assert_redirected_to special_occasion_path(assigns(:special_occasion))
  end

  test "should destroy special_occasion" do
    assert_difference('SpecialOccasion.count', -1) do
      delete :destroy, id: @special_occasion
    end

    assert_redirected_to special_occasions_path
  end
end
