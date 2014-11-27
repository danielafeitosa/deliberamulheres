require 'test_helper'

class MembroComissaosControllerTest < ActionController::TestCase
  setup do
    @membro_comissao = membro_comissaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:membro_comissaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create membro_comissao" do
    assert_difference('MembroComissao.count') do
      post :create, membro_comissao: { condicao_membro: @membro_comissao.condicao_membro, data_entrada: @membro_comissao.data_entrada, data_saida: @membro_comissao.data_saida }
    end

    assert_redirected_to membro_comissao_path(assigns(:membro_comissao))
  end

  test "should show membro_comissao" do
    get :show, id: @membro_comissao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @membro_comissao
    assert_response :success
  end

  test "should update membro_comissao" do
    put :update, id: @membro_comissao, membro_comissao: { condicao_membro: @membro_comissao.condicao_membro, data_entrada: @membro_comissao.data_entrada, data_saida: @membro_comissao.data_saida }
    assert_redirected_to membro_comissao_path(assigns(:membro_comissao))
  end

  test "should destroy membro_comissao" do
    assert_difference('MembroComissao.count', -1) do
      delete :destroy, id: @membro_comissao
    end

    assert_redirected_to membro_comissaos_path
  end
end
