require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image" do
    assert_difference('Image.count') do
      post :create, image: { base_product: @image.base_product, bucket_name: @image.bucket_name, content_type: @image.content_type, file_name: @image.file_name, file_size: @image.file_size, finished_product: @image.finished_product, uploaded_by: @image.uploaded_by }
    end

    assert_redirected_to image_path(assigns(:image))
  end

  test "should show image" do
    get :show, id: @image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image
    assert_response :success
  end

  test "should update image" do
    put :update, id: @image, image: { base_product: @image.base_product, bucket_name: @image.bucket_name, content_type: @image.content_type, file_name: @image.file_name, file_size: @image.file_size, finished_product: @image.finished_product, uploaded_by: @image.uploaded_by }
    assert_redirected_to image_path(assigns(:image))
  end

  test "should destroy image" do
    assert_difference('Image.count', -1) do
      delete :destroy, id: @image
    end

    assert_redirected_to images_path
  end
end
