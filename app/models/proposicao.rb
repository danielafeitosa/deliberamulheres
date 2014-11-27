class Proposicao < ActiveRecord::Base
  belongs_to :reuniao_id
  attr_accessible :ementa, :id_proposicao, :resultado, :sigla
end
