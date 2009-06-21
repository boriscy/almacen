require 'test_helper'

class PartidasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partida" do
    assert_difference('Partida.count') do
      post :create, :partida => { }
    end

    assert_redirected_to partida_path(assigns(:partida))
  end

  test "should show partida" do
    get :show, :id => partidas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => partidas(:one).to_param
    assert_response :success
  end

  test "should update partida" do
    put :update, :id => partidas(:one).to_param, :partida => { }
    assert_redirected_to partida_path(assigns(:partida))
  end

  test "should destroy partida" do
    assert_difference('Partida.count', -1) do
      delete :destroy, :id => partidas(:one).to_param
    end

    assert_redirected_to partidas_path
  end
end
