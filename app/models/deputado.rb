class Deputado < ActiveRecord::Base

  mount_uploader :foto, PictureUploader

  belongs_to :partido
  has_one :membro_comissao
  attr_accessible :anexo, :data_falecimento, :data_nascimento, :email, :fone,
:foto, :gabinete, :id_parlamentar, :id_parlamentar_deprecated, :ide_cadastro,
:matricula, :nome, :nome_civil, :nome_parlamentar, :nome_parlamentar_atual,
:nome_profissao, :num_legislatura, :sexo, :status,
:situacao_legislatura_atual, :uf, :uf_representacao_atual, :url_foto, :partido

  def commissao_principal
    self.membro_comissao.comissao.name
  end
end
