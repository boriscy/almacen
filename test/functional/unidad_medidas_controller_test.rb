require 'test_helper'

class UnidadMedidasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidad_medidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidad_medida" do
    assert_difference('UnidadMedida.count') do
      post :create, :unidad_medida => { }
    end

    assert_redirected_to unidad_medida_path(assigns(:unidad_medida))
  end

  test "should show unidad_medida" do
    get :show, :id => unidad_medidas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unidad_medidas(:one).to_param
    assert_response :success
  end

  test "should update unidad_medida" do
    put :update, :id => unidad_medidas(:one).to_param, :unidad_medida => { }
    assert_redirected_to unidad_medida_path(assigns(:unidad_medida))
  end

  test "should destroy unidad_medida" do
    assert_difference('UnidadMedida.count', -1) do
      delete :destroy, :id => unidad_medidas(:one).to_param
    end

    assert_redirected_to unidad_medidas_path
  end
end
