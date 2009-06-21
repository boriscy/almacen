require 'test_helper'

class UnidadsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidad" do
    assert_difference('Unidad.count') do
      post :create, :unidad => { }
    end

    assert_redirected_to unidad_path(assigns(:unidad))
  end

  test "should show unidad" do
    get :show, :id => unidads(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unidads(:one).to_param
    assert_response :success
  end

  test "should update unidad" do
    put :update, :id => unidads(:one).to_param, :unidad => { }
    assert_redirected_to unidad_path(assigns(:unidad))
  end

  test "should destroy unidad" do
    assert_difference('Unidad.count', -1) do
      delete :destroy, :id => unidads(:one).to_param
    end

    assert_redirected_to unidads_path
  end
end
