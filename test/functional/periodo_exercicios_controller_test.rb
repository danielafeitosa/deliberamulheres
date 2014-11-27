require 'test_helper'

class PeriodoExerciciosControllerTest < ActionController::TestCase
  setup do
    @periodo_exercicio = periodo_exercicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodo_exercicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodo_exercicio" do
    assert_difference('PeriodoExercicio.count') do
      post :create, periodo_exercicio: { data_fim: @periodo_exercicio.data_fim, data_inicio: @periodo_exercicio.data_inicio, descricao_causa_fim_exercicio: @periodo_exercicio.descricao_causa_fim_exercicio, id_cadastro_parlamentar_anterior: @periodo_exercicio.id_cadastro_parlamentar_anterior, id_causa_fim_exercicio: @periodo_exercicio.id_causa_fim_exercicio, sigla_uf_representacao: @periodo_exercicio.sigla_uf_representacao, situacao_exercicio: @periodo_exercicio.situacao_exercicio }
    end

    assert_redirected_to periodo_exercicio_path(assigns(:periodo_exercicio))
  end

  test "should show periodo_exercicio" do
    get :show, id: @periodo_exercicio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @periodo_exercicio
    assert_response :success
  end

  test "should update periodo_exercicio" do
    put :update, id: @periodo_exercicio, periodo_exercicio: { data_fim: @periodo_exercicio.data_fim, data_inicio: @periodo_exercicio.data_inicio, descricao_causa_fim_exercicio: @periodo_exercicio.descricao_causa_fim_exercicio, id_cadastro_parlamentar_anterior: @periodo_exercicio.id_cadastro_parlamentar_anterior, id_causa_fim_exercicio: @periodo_exercicio.id_causa_fim_exercicio, sigla_uf_representacao: @periodo_exercicio.sigla_uf_representacao, situacao_exercicio: @periodo_exercicio.situacao_exercicio }
    assert_redirected_to periodo_exercicio_path(assigns(:periodo_exercicio))
  end

  test "should destroy periodo_exercicio" do
    assert_difference('PeriodoExercicio.count', -1) do
      delete :destroy, id: @periodo_exercicio
    end

    assert_redirected_to periodo_exercicios_path
  end
end
