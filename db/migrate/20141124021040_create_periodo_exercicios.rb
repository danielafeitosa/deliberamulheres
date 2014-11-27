class CreatePeriodoExercicios < ActiveRecord::Migration
  def change
    create_table :periodo_exercicios do |t|
      t.references :deputado
      t.string :sigla_uf_representacao
      t.string :situacao_exercicio
      t.date :data_inicio
      t.date :data_fim
      t.integer :id_causa_fim_exercicio
      t.text :descricao_causa_fim_exercicio
      t.integer :id_cadastro_parlamentar_anterior

      t.timestamps
    end
    add_index :periodo_exercicios, :deputado_id
  end
end
