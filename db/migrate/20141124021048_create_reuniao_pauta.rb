class CreateReuniaoPauta < ActiveRecord::Migration
  def change
    create_table :reuniao_pauta do |t|
      t.references :orgao
      t.integer :cod_reuniao
      t.date :data
      t.string :horario
      t.string :local
      t.string :estado
      t.string :tipo
      t.string :titulo_reuniao
      t.text :objeto

      t.timestamps
    end
    add_index :reuniao_pauta, :orgao_id
  end
end
