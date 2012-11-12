require 'test_helper'

class PayPalStatusesControllerTest < ActionController::TestCase
  setup do
    @pay_pal_status = pay_pal_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_pal_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_pal_status" do
    assert_difference('PayPalStatus.count') do
      post :create, pay_pal_status: { charged_back: @pay_pal_status.charged_back, description: @pay_pal_status.description, name: @pay_pal_status.name, paid_sale: @pay_pal_status.paid_sale, pending_authorisation: @pay_pal_status.pending_authorisation }
    end

    assert_redirected_to pay_pal_status_path(assigns(:pay_pal_status))
  end

  test "should show pay_pal_status" do
    get :show, id: @pay_pal_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_pal_status
    assert_response :success
  end

  test "should update pay_pal_status" do
    put :update, id: @pay_pal_status, pay_pal_status: { charged_back: @pay_pal_status.charged_back, description: @pay_pal_status.description, name: @pay_pal_status.name, paid_sale: @pay_pal_status.paid_sale, pending_authorisation: @pay_pal_status.pending_authorisation }
    assert_redirected_to pay_pal_status_path(assigns(:pay_pal_status))
  end

  test "should destroy pay_pal_status" do
    assert_difference('PayPalStatus.count', -1) do
      delete :destroy, id: @pay_pal_status
    end

    assert_redirected_to pay_pal_statuses_path
  end
end
