class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :partida_id
      t.string :codigo
      t.string :nombre
      t.string :unidad_medida
      t.string :foto_file_name

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
