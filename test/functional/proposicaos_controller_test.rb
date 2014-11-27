require 'test_helper'

class ProposicaosControllerTest < ActionController::TestCase
  setup do
    @proposicao = proposicaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposicaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposicao" do
    assert_difference('Proposicao.count') do
      post :create, proposicao: { ementa: @proposicao.ementa, id_proposicao: @proposicao.id_proposicao, resultado: @proposicao.resultado, sigla: @proposicao.sigla }
    end

    assert_redirected_to proposicao_path(assigns(:proposicao))
  end

  test "should show proposicao" do
    get :show, id: @proposicao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposicao
    assert_response :success
  end

  test "should update proposicao" do
    put :update, id: @proposicao, proposicao: { ementa: @proposicao.ementa, id_proposicao: @proposicao.id_proposicao, resultado: @proposicao.resultado, sigla: @proposicao.sigla }
    assert_redirected_to proposicao_path(assigns(:proposicao))
  end

  test "should destroy proposicao" do
    assert_difference('Proposicao.count', -1) do
      delete :destroy, id: @proposicao
    end

    assert_redirected_to proposicaos_path
  end
end
