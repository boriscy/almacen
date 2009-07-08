require 'test_helper'

class AlmacenesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:almacenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create almacen" do
    assert_difference('Almacen.count') do
      post :create, :almacen => { }
    end

    assert_redirected_to almacen_path(assigns(:almacen))
  end

  test "should show almacen" do
    get :show, :id => almacenes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => almacenes(:one).to_param
    assert_response :success
  end

  test "should update almacen" do
    put :update, :id => almacenes(:one).to_param, :almacen => { }
    assert_redirected_to almacen_path(assigns(:almacen))
  end

  test "should destroy almacen" do
    assert_difference('Almacen.count', -1) do
      delete :destroy, :id => almacenes(:one).to_param
    end

    assert_redirected_to almacenes_path
  end
end
