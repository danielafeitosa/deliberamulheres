class CreateOrgaos < ActiveRecord::Migration
  def change
    create_table :orgaos do |t|
      t.string :name
      t.string :sigla
      t.integer :id_tipo_orgao
      t.integer :id_orgao_legislativo
      t.text :descricao

      t.timestamps
    end
  end
end
