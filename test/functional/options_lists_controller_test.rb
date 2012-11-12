require 'test_helper'

class OptionsListsControllerTest < ActionController::TestCase
  setup do
    @options_list = options_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:options_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create options_list" do
    assert_difference('OptionsList.count') do
      post :create, options_list: { name: @options_list.name, options: @options_list.options, visible_label: @options_list.visible_label }
    end

    assert_redirected_to options_list_path(assigns(:options_list))
  end

  test "should show options_list" do
    get :show, id: @options_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @options_list
    assert_response :success
  end

  test "should update options_list" do
    put :update, id: @options_list, options_list: { name: @options_list.name, options: @options_list.options, visible_label: @options_list.visible_label }
    assert_redirected_to options_list_path(assigns(:options_list))
  end

  test "should destroy options_list" do
    assert_difference('OptionsList.count', -1) do
      delete :destroy, id: @options_list
    end

    assert_redirected_to options_lists_path
  end
end
