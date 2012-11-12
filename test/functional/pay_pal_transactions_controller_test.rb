require 'test_helper'

class PayPalTransactionsControllerTest < ActionController::TestCase
  setup do
    @pay_pal_transaction = pay_pal_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_pal_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_pal_transaction" do
    assert_difference('PayPalTransaction.count') do
      post :create, pay_pal_transaction: { amount: @pay_pal_transaction.amount, currency_code: @pay_pal_transaction.currency_code, currency_id: @pay_pal_transaction.currency_id, paypal_transaction_id: @pay_pal_transaction.paypal_transaction_id, rest_of_the_stuff_serialised: @pay_pal_transaction.rest_of_the_stuff_serialised, result_code: @pay_pal_transaction.result_code, shopping_cart_id: @pay_pal_transaction.shopping_cart_id }
    end

    assert_redirected_to pay_pal_transaction_path(assigns(:pay_pal_transaction))
  end

  test "should show pay_pal_transaction" do
    get :show, id: @pay_pal_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_pal_transaction
    assert_response :success
  end

  test "should update pay_pal_transaction" do
    put :update, id: @pay_pal_transaction, pay_pal_transaction: { amount: @pay_pal_transaction.amount, currency_code: @pay_pal_transaction.currency_code, currency_id: @pay_pal_transaction.currency_id, paypal_transaction_id: @pay_pal_transaction.paypal_transaction_id, rest_of_the_stuff_serialised: @pay_pal_transaction.rest_of_the_stuff_serialised, result_code: @pay_pal_transaction.result_code, shopping_cart_id: @pay_pal_transaction.shopping_cart_id }
    assert_redirected_to pay_pal_transaction_path(assigns(:pay_pal_transaction))
  end

  test "should destroy pay_pal_transaction" do
    assert_difference('PayPalTransaction.count', -1) do
      delete :destroy, id: @pay_pal_transaction
    end

    assert_redirected_to pay_pal_transactions_path
  end
end
