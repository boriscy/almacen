class CreateSolicitudes < ActiveRecord::Migration
  def self.up
    create_table :solicitudes do |t|
      t.integer :usuario_id
      t.datetime :fecha
      t.string :estado
      t.datetime :fecha_aprobacion

      t.timestamps
    end
  end

  def self.down
    drop_table :solicitudes
  end
end
