class CreatePermisos < ActiveRecord::Migration
  def self.up
    create_table :permisos do |t|
      t.integer :rol_id
      t.string :controlador, :limit => 100
      t.string :acciones # Serialización de lista de acciones

      t.timestamps
    end
  end

  def self.down
    drop_table :permisos
  end
end
