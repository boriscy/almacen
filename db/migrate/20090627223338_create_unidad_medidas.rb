class CreateUnidadMedidas < ActiveRecord::Migration
  def self.up
    create_table :unidad_medidas do |t|
      t.string :nombre
      t.string :abreviacion
      t.boolean :entero, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :unidad_medidas
  end
end
