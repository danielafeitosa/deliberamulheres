class PeriodoExercicio < ActiveRecord::Base
  belongs_to :deputado_id
  attr_accessible :data_fim, :data_inicio, :descricao_causa_fim_exercicio, :id_cadastro_parlamentar_anterior, :id_causa_fim_exercicio, :sigla_uf_representacao, :situacao_exercicio
end
