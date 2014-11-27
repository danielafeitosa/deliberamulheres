class CreateDeputados < ActiveRecord::Migration
  def change
    create_table :deputados do |t|
      t.integer :ide_cadastro
      t.string :status
      t.integer :matricula
      t.integer :id_parlamentar
      t.string :nome
      t.string :nome_parlamentar
      t.string :url_foto
      t.string :foto
      t.string :sexo
      t.string :uf
      t.references :partido
      t.string :gabinete
      t.string :anexo
      t.string :fone
      t.string :email
      t.integer :num_legislatura
      t.string :nome_profissao
      t.date :data_nascimento
      t.date :data_falecimento
      t.string :uf_representacao_atual
      t.string :situacao_legislatura_atual
      t.integer :id_parlamentar_deprecated
      t.string :nome_parlamentar_atual
      t.string :nome_civil

      t.timestamps
    end
    add_index :deputados, :partido_id
  end
end
