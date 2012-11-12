require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  setup do
    @static_page = static_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_page" do
    assert_difference('StaticPage.count') do
      post :create, static_page: { footer_running_order: @static_page.footer_running_order, main_body: @static_page.main_body, main_heading: @static_page.main_heading, main_menu_running_order: @static_page.main_menu_running_order, menu_label: @static_page.menu_label, page_description: @static_page.page_description, search_terms: @static_page.search_terms, show_in_main_menu: @static_page.show_in_main_menu, show_in_page_footer: @static_page.show_in_page_footer, window_title: @static_page.window_title }
    end

    assert_redirected_to static_page_path(assigns(:static_page))
  end

  test "should show static_page" do
    get :show, id: @static_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @static_page
    assert_response :success
  end

  test "should update static_page" do
    put :update, id: @static_page, static_page: { footer_running_order: @static_page.footer_running_order, main_body: @static_page.main_body, main_heading: @static_page.main_heading, main_menu_running_order: @static_page.main_menu_running_order, menu_label: @static_page.menu_label, page_description: @static_page.page_description, search_terms: @static_page.search_terms, show_in_main_menu: @static_page.show_in_main_menu, show_in_page_footer: @static_page.show_in_page_footer, window_title: @static_page.window_title }
    assert_redirected_to static_page_path(assigns(:static_page))
  end

  test "should destroy static_page" do
    assert_difference('StaticPage.count', -1) do
      delete :destroy, id: @static_page
    end

    assert_redirected_to static_pages_path
  end
end
