class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :category
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
