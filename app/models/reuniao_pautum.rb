class ReuniaoPautum < ActiveRecord::Base
  belongs_to :orgao_id
  attr_accessible :cod_reuniao, :data, :estado, :horario, :local, :objeto, :tipo, :titulo_reuniao
end
