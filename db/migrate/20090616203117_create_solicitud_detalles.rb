class CreateSolicitudDetalles < ActiveRecord::Migration
  def self.up
    create_table :solicitud_detalles do |t|
      t.integer :solicitud_id
      t.integer :item_id
      t.decimal :cantidad, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :solicitud_detalles
  end
end
