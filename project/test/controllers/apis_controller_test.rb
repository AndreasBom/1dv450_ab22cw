require 'test_helper'

class ApisControllerTest < ActionController::TestCase
  setup do
    @api = apis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apiservice" do
    assert_difference('Api.count') do
      post :create, apiservice: {  }
    end

    assert_redirected_to api_path(assigns(:apiservice))
  end

  test "should show apiservice" do
    get :show, id: @api
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api
    assert_response :success
  end

  test "should update apiservice" do
    patch :update, id: @api, apiservice: {  }
    assert_redirected_to api_path(assigns(:apiservice))
  end

  test "should destroy apiservice" do
    assert_difference('Api.count', -1) do
      delete :destroy, id: @api
    end

    assert_redirected_to apis_path
  end
end
