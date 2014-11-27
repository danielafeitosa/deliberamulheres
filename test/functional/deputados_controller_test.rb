require 'test_helper'

class DeputadosControllerTest < ActionController::TestCase
  setup do
    @deputado = deputados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deputados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deputado" do
    assert_difference('Deputado.count') do
      post :create, deputado: { anexo: @deputado.anexo, data_falecimento: @deputado.data_falecimento, data_nascimento: @deputado.data_nascimento, email: @deputado.email, fone: @deputado.fone, foto: @deputado.foto, gabinete: @deputado.gabinete, id_parlamentar: @deputado.id_parlamentar, id_parlamentar_deprecated: @deputado.id_parlamentar_deprecated, ide_cadastro: @deputado.ide_cadastro, matricula: @deputado.matricula, nome: @deputado.nome, nome_civil: @deputado.nome_civil, nome_parlamentar: @deputado.nome_parlamentar, nome_parlamentar_atual: @deputado.nome_parlamentar_atual, nome_profissao: @deputado.nome_profissao, num_legislatura: @deputado.num_legislatura, sexo: @deputado.sexo, status: @deputado.status, status_legislatura_atual: @deputado.status_legislatura_atual, uf: @deputado.uf, uf_representacao_atual: @deputado.uf_representacao_atual, url_foto: @deputado.url_foto }
    end

    assert_redirected_to deputado_path(assigns(:deputado))
  end

  test "should show deputado" do
    get :show, id: @deputado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deputado
    assert_response :success
  end

  test "should update deputado" do
    put :update, id: @deputado, deputado: { anexo: @deputado.anexo, data_falecimento: @deputado.data_falecimento, data_nascimento: @deputado.data_nascimento, email: @deputado.email, fone: @deputado.fone, foto: @deputado.foto, gabinete: @deputado.gabinete, id_parlamentar: @deputado.id_parlamentar, id_parlamentar_deprecated: @deputado.id_parlamentar_deprecated, ide_cadastro: @deputado.ide_cadastro, matricula: @deputado.matricula, nome: @deputado.nome, nome_civil: @deputado.nome_civil, nome_parlamentar: @deputado.nome_parlamentar, nome_parlamentar_atual: @deputado.nome_parlamentar_atual, nome_profissao: @deputado.nome_profissao, num_legislatura: @deputado.num_legislatura, sexo: @deputado.sexo, status: @deputado.status, status_legislatura_atual: @deputado.status_legislatura_atual, uf: @deputado.uf, uf_representacao_atual: @deputado.uf_representacao_atual, url_foto: @deputado.url_foto }
    assert_redirected_to deputado_path(assigns(:deputado))
  end

  test "should destroy deputado" do
    assert_difference('Deputado.count', -1) do
      delete :destroy, id: @deputado
    end

    assert_redirected_to deputados_path
  end
end
