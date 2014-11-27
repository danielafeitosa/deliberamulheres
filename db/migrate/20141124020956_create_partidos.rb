class CreatePartidos < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :name
      t.string :sigla
      t.string :id_partido

      t.timestamps
    end
  end
end
