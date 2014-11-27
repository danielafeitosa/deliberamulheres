class CreateProposicaos < ActiveRecord::Migration
  def change
    create_table :proposicaos do |t|
      t.references :reuniao
      t.string :sigla
      t.integer :id_proposicao
      t.text :ementa
      t.text :resultado

      t.timestamps
    end
    add_index :proposicaos, :reuniao_id
  end
end
