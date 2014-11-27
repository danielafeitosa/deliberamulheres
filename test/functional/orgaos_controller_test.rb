require 'test_helper'

class OrgaosControllerTest < ActionController::TestCase
  setup do
    @orgao = orgaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgao" do
    assert_difference('Orgao.count') do
      post :create, orgao: { descricao: @orgao.descricao, id_orgao_legislativo: @orgao.id_orgao_legislativo, id_tipo_orgao: @orgao.id_tipo_orgao, name: @orgao.name, sigla: @orgao.sigla }
    end

    assert_redirected_to orgao_path(assigns(:orgao))
  end

  test "should show orgao" do
    get :show, id: @orgao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orgao
    assert_response :success
  end

  test "should update orgao" do
    put :update, id: @orgao, orgao: { descricao: @orgao.descricao, id_orgao_legislativo: @orgao.id_orgao_legislativo, id_tipo_orgao: @orgao.id_tipo_orgao, name: @orgao.name, sigla: @orgao.sigla }
    assert_redirected_to orgao_path(assigns(:orgao))
  end

  test "should destroy orgao" do
    assert_difference('Orgao.count', -1) do
      delete :destroy, id: @orgao
    end

    assert_redirected_to orgaos_path
  end
end
