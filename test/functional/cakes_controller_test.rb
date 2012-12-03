require 'test_helper'

class CakesControllerTest < ActionController::TestCase
  setup do
    @cake = cakes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cakes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cake" do
    assert_difference('Cake.count') do
      post :create, cake: { based_on_finished_product_id: @cake.based_on_finished_product_id, cake_required_at: @cake.cake_required_at, confectioners_notes: @cake.confectioners_notes, general_description_from_customer: @cake.general_description_from_customer, name_to_appear_on_cake: @cake.name_to_appear_on_cake, production_quotum_id: @cake.production_quotum_id, shopping_cart_id: @cake.shopping_cart_id, special_occasion: @cake.special_occasion, weekday: @cake.weekday }
    end

    assert_redirected_to cake_path(assigns(:cake))
  end

  test "should show cake" do
    get :show, id: @cake
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cake
    assert_response :success
  end

  test "should update cake" do
    put :update, id: @cake, cake: { based_on_finished_product_id: @cake.based_on_finished_product_id, cake_required_at: @cake.cake_required_at, confectioners_notes: @cake.confectioners_notes, general_description_from_customer: @cake.general_description_from_customer, name_to_appear_on_cake: @cake.name_to_appear_on_cake, production_quotum_id: @cake.production_quotum_id, shopping_cart_id: @cake.shopping_cart_id, special_occasion: @cake.special_occasion, weekday: @cake.weekday }
    assert_redirected_to cake_path(assigns(:cake))
  end

  test "should destroy cake" do
    assert_difference('Cake.count', -1) do
      delete :destroy, id: @cake
    end

    assert_redirected_to cakes_path
  end
end
