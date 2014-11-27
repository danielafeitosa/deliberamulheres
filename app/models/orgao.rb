class Orgao < ActiveRecord::Base
  attr_accessible :descricao, :id_orgao_legislativo, :id_tipo_orgao, :name, :sigla
end
