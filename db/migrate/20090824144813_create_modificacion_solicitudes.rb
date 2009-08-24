class CreateModificacionSolicitudes < ActiveRecord::Migration
  def self.up
    create_table :modificacion_solicitudes do |t|
      t.references :solicitud
      t.references :usuario
      t.text :descripcion
      t.text :detalles

      t.timestamps
    end
  end

  def self.down
    drop_table :modificacion_solicitudes
  end
end
