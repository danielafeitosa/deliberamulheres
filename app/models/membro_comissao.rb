class MembroComissao < ActiveRecord::Base
  belongs_to :comissao_id
  belongs_to :deputado_id
  attr_accessible :condicao_membro, :data_entrada, :data_saida
end
