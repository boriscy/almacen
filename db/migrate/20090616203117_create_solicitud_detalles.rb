class CreateSolicitudDetalles < ActiveRecord::Migration
  def self.up
    create_table :solicitudes_detalles do |t|
      t.integer :solicitud_id
      t.integer :item_id
      t.decimal :cantidad

      t.timestamps
    end
  end

  def self.down
    drop_table :solicitudes_detalles
  end
end
