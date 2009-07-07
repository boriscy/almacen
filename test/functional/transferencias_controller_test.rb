require 'test_helper'

class TransferenciasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transferencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transferencia" do
    assert_difference('Transferencia.count') do
      post :create, :transferencia => { }
    end

    assert_redirected_to transferencia_path(assigns(:transferencia))
  end

  test "should show transferencia" do
    get :show, :id => transferencias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => transferencias(:one).to_param
    assert_response :success
  end

  test "should update transferencia" do
    put :update, :id => transferencias(:one).to_param, :transferencia => { }
    assert_redirected_to transferencia_path(assigns(:transferencia))
  end

  test "should destroy transferencia" do
    assert_difference('Transferencia.count', -1) do
      delete :destroy, :id => transferencias(:one).to_param
    end

    assert_redirected_to transferencias_path
  end
end
