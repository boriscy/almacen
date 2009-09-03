class CreateSolicitudModificaciones < ActiveRecord::Migration
  def self.up
    create_table :solicitud_modificaciones do |t|
      t.references :usuario
      t.references :solicitud
      t.text :descripcion
      t.text :detalles
      t.integer :estado

      t.timestamps
    end
  end

  def self.down
    drop_table :solicitud_modificaciones
  end
end
