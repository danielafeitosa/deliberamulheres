class MembroComissao < ActiveRecord::Base
  belongs_to :comissao, :class_name => 'Orgao'
  belongs_to :deputado, :class_name => 'Deputado'
  attr_accessible :condicao_membro, :data_entrada, :data_saida, :comissao,
:deputado
end
