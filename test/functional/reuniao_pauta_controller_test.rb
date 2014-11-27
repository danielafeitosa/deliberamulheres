require 'test_helper'

class ReuniaoPautaControllerTest < ActionController::TestCase
  setup do
    @reuniao_pautum = reuniao_pauta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reuniao_pauta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reuniao_pautum" do
    assert_difference('ReuniaoPautum.count') do
      post :create, reuniao_pautum: { cod_reuniao: @reuniao_pautum.cod_reuniao, data: @reuniao_pautum.data, estado: @reuniao_pautum.estado, horario: @reuniao_pautum.horario, local: @reuniao_pautum.local, objeto: @reuniao_pautum.objeto, tipo: @reuniao_pautum.tipo, titulo_reuniao: @reuniao_pautum.titulo_reuniao }
    end

    assert_redirected_to reuniao_pautum_path(assigns(:reuniao_pautum))
  end

  test "should show reuniao_pautum" do
    get :show, id: @reuniao_pautum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reuniao_pautum
    assert_response :success
  end

  test "should update reuniao_pautum" do
    put :update, id: @reuniao_pautum, reuniao_pautum: { cod_reuniao: @reuniao_pautum.cod_reuniao, data: @reuniao_pautum.data, estado: @reuniao_pautum.estado, horario: @reuniao_pautum.horario, local: @reuniao_pautum.local, objeto: @reuniao_pautum.objeto, tipo: @reuniao_pautum.tipo, titulo_reuniao: @reuniao_pautum.titulo_reuniao }
    assert_redirected_to reuniao_pautum_path(assigns(:reuniao_pautum))
  end

  test "should destroy reuniao_pautum" do
    assert_difference('ReuniaoPautum.count', -1) do
      delete :destroy, id: @reuniao_pautum
    end

    assert_redirected_to reuniao_pauta_path
  end
end
