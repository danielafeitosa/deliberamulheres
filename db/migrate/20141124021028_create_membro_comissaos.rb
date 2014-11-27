class CreateMembroComissaos < ActiveRecord::Migration
  def change
    create_table :membro_comissaos do |t|
      t.references :comissao
      t.references :deputado
      t.string :condicao_membro
      t.date :data_entrada
      t.date :data_saida

      t.timestamps
    end
    add_index :membro_comissaos, :comissao_id
    add_index :membro_comissaos, :deputado_id
  end
end
